import Foundation
import TUSKit

/// A video uploader implementation that uses the TUS protocol for reliable file uploads.
///
/// `TUSVideoUploader` provides a robust implementation of video uploading using the TUS (Transloadit Upload Service)
/// protocol, which supports resumable uploads. This implementation handles:
/// - Chunked file uploads
/// - Upload progress tracking
/// - Pause and resume capabilities
/// - Background upload support
/// - Automatic retry of failed uploads
///
/// The uploader integrates with the TUSKit framework to handle the low-level TUS protocol
/// implementation while providing a high-level interface for video uploads.
public final class TUSVideoUploader {
  /// The tracker that monitors the status of all uploads.
  public let uploadTracker: UploadTracker

  /// The TUS client responsible for handling the actual upload operations.
  private let tusClient: TUSClient

  /// The signer that generates authentication signatures for upload requests.
  private let videoSigner: VideoSHA256Signer

  /// The builder that constructs HTTP headers for upload requests.
  private let videoRequestHeaderBuilder: VideoRequestHeaderBuilder

  /// The API access key used for request authentication.
  private let accessKey: String

  /// Creates a new TUS video uploader instance.
  ///
  /// - Parameters:
  ///   - uploadTracker: The tracker that will monitor upload progress.
  ///   - tusClient: The TUS client that will handle the upload operations.
  ///   - videoSigner: The signer that will generate authentication signatures.
  ///   - videoRequestHeaderBuilder: The builder that will construct request headers.
  ///   - accessKey: The API access key for authentication.
  init(uploadTracker: UploadTracker,
       tusClient: TUSClient,
       videoSigner: VideoSHA256Signer,
       videoRequestHeaderBuilder: VideoRequestHeaderBuilder,
       accessKey: String) {
    self.uploadTracker = uploadTracker
    self.tusClient = tusClient
    self.videoSigner = videoSigner
    self.videoRequestHeaderBuilder = videoRequestHeaderBuilder
    self.accessKey = accessKey
  }
}

// MARK: - VideoUploader
extension TUSVideoUploader: VideoUploadable {
  /// Uploads multiple videos using the TUS protocol.
  ///
  /// This method processes each video sequentially, preparing the necessary headers
  /// and initiating the TUS upload process. For each video:
  /// 1. Generates authentication headers
  /// 2. Initiates the upload
  /// 3. Registers the upload with the tracker
  ///
  /// - Parameter infos: An array of video information objects to upload.
  /// - Throws: `VideoUploaderError.failedToUploadVideo` if the upload cannot be initiated.
  public func uploadVideos(with infos: [VideoInfo]) async throws {
    for info in infos {
      let headers = prepareHeaders(for: info)

      guard let validUUID = uploadContent(from: info, headers: headers),
            let videoUUIDInstance = UUID(uuidString: info.videoId) else {
        throw VideoUploaderError.failedToUploadVideo
      }

      let uploadVideoInfo = UploadVideoInfo(uuid: validUUID, videoUUID: videoUUIDInstance, info: info)
      uploadTracker.addUpload(info: uploadVideoInfo, status: .uploading(progress: .zero))
    }
  }
}

// MARK: - VideoUploaderActions
extension TUSVideoUploader: VideoUploaderActions {
  /// Pauses an ongoing upload.
  ///
  /// This method cancels the TUS upload operation and updates the tracker to reflect
  /// the paused state. The upload can be resumed later using `resumeUpload(for:)`.
  ///
  /// - Parameter info: The information about the upload to pause.
  /// - Throws: An error if the TUS client fails to cancel the upload.
  public func pauseUpload(for info: UploadVideoInfo) throws {
    try tusClient.cancel(id: info.uuid)
    uploadTracker.pauseUpload(id: info.uuid)
  }

  /// Resumes a previously paused upload.
  ///
  /// This method restarts the TUS upload operation from where it was paused
  /// and updates the tracker to reflect the resumed state.
  ///
  /// - Parameter info: The information about the upload to resume.
  /// - Throws: An error if the TUS client fails to resume the upload.
  public func resumeUpload(for info: UploadVideoInfo) throws {
    _ = try tusClient.resume(id: info.uuid)
    uploadTracker.resumeUpload(id: info.uuid)
  }

  /// Permanently removes an upload.
  ///
  /// This method:
  /// 1. Cancels any ongoing upload operation
  /// 2. Removes the upload from the TUS client's cache
  /// 3. Removes the upload from the tracker
  ///
  /// - Parameter info: The information about the upload to remove.
  /// - Throws: An error if the TUS client operations fail.
  public func removeUpload(for info: UploadVideoInfo) throws {
    _ = try tusClient.cancel(id: info.uuid)
    _ = try tusClient.removeCacheFor(id: info.uuid)
    uploadTracker.removeUpload(id: info.uuid)
  }
}

// MARK: - Public methods
public extension TUSVideoUploader {
  /// Starts the TUS client and processes any existing uploads.
  ///
  /// This method:
  /// 1. Starts the TUS client
  /// 2. Attempts to retry any failed uploads
  /// 3. Restores any stored uploads from previous sessions
  /// 4. Performs cleanup of the TUS client
  ///
  /// - Throws: An error if the TUS client fails to start.
  func start() throws {
    _ = tusClient.start()

    try? handleFailedUploads()
    try? handleStoredUploads()

    tusClient.cleanup()
  }

  /// Registers a handler for background upload operations.
  ///
  /// This method sets up the necessary handling for uploads to continue
  /// when the app is in the background.
  ///
  /// - Parameters:
  ///   - handler: A closure to be called when background operations occur.
  ///   - sessionIdentifier: The identifier for the background session.
  func registerBackgroundHandler(_ handler: @escaping () -> Void,
                                 forSession sessionIdentifier: String) {
    tusClient.registerBackgroundHandler(handler, forSession: sessionIdentifier)
  }
}

// MARK: - TUSClientDelegate
extension TUSVideoUploader: TUSClientDelegate {
  /// Updates the upload progress for a specific upload.
  ///
  /// - Parameters:
  ///   - id: The identifier of the upload.
  ///   - context: Additional context information from the TUS client.
  ///   - bytesUploaded: The number of bytes uploaded so far.
  ///   - totalBytes: The total number of bytes to upload.
  ///   - client: The TUS client reporting the progress.
  public func progressFor(id: UUID, context: [String: String]?, bytesUploaded: Int, totalBytes: Int, client: TUSClient) {
    let status = UploadStatus.uploading(progress: .init(bytesUploaded: bytesUploaded, totalBytes: totalBytes))
    uploadTracker.addOrUpdateUpload(id: id, status: status)
  }

  /// Handles the start of an upload operation.
  ///
  /// - Parameters:
  ///   - id: The identifier of the upload.
  ///   - context: Additional context information from the TUS client.
  ///   - client: The TUS client that started the upload.
  public func didStartUpload(id: UUID, context: [String : String]?, client: TUSClient) {
    let status = UploadStatus.uploading(progress: .init(bytesUploaded: 0, totalBytes: Int.max))
    uploadTracker.addOrUpdateUpload(id: id, status: status)
  }

  /// Handles the successful completion of an upload.
  ///
  /// - Parameters:
  ///   - id: The identifier of the completed upload.
  ///   - url: The URL where the uploaded file can be accessed.
  ///   - context: Additional context information from the TUS client.
  ///   - client: The TUS client that completed the upload.
  public func didFinishUpload(id: UUID, url: URL, context: [String : String]?, client: TUSClient) {
    let status = UploadStatus.uploaded(url: url)
    uploadTracker.addOrUpdateUpload(id: id, status: status)
  }

  /// Handles upload failures.
  ///
  /// - Parameters:
  ///   - id: The identifier of the failed upload.
  ///   - error: The error that caused the failure.
  ///   - context: Additional context information from the TUS client.
  ///   - client: The TUS client reporting the failure.
  public func uploadFailed(id: UUID, error: Error, context: [String : String]?, client: TUSClient) {
    let status = UploadStatus.failed(error: error.localizedDescription)
    uploadTracker.addOrUpdateUpload(id: id, status: status)
  }

  /// Handles file-related errors.
  ///
  /// - Parameters:
  ///   - error: The file error that occurred.
  ///   - client: The TUS client reporting the error.
  public func fileError(error: TUSClientError, client: TUSClient) { }

  /// Handles overall upload progress across all uploads.
  ///
  /// - Parameters:
  ///   - bytesUploaded: The total number of bytes uploaded across all uploads.
  ///   - totalBytes: The total number of bytes to upload across all uploads.
  ///   - client: The TUS client reporting the progress.
  public func totalProgress(bytesUploaded: Int, totalBytes: Int, client: TUSClient) { }
}

// MARK: - Private methods
private extension TUSVideoUploader {
  /// Prepares the authentication and metadata headers for a video upload.
  ///
  /// This method:
  /// 1. Generates an authentication signature using the video signer
  /// 2. Builds the complete set of headers using the header builder
  ///
  /// - Parameter info: The video information to prepare headers for.
  /// - Returns: A dictionary of HTTP headers required for the upload.
  func prepareHeaders(for info: VideoInfo) -> Headers {
    let signature = videoSigner.sign(info: info, apiKey: accessKey)
    return videoRequestHeaderBuilder.buildHeaders(for: info, signature: signature)
  }

  /// Initiates the upload of video content using the TUS client.
  ///
  /// This method handles both file-based and data-based video content,
  /// using the appropriate TUS client method for each type.
  ///
  /// - Parameters:
  ///   - info: The video information containing the content to upload.
  ///   - headers: The prepared HTTP headers for the upload.
  /// - Returns: A UUID identifying the upload if successful, nil otherwise.
  func uploadContent(from info: VideoInfo, headers: Headers) -> UUID? {
    switch info.content {
    case .url(let url):
      return try? tusClient.uploadFileAt(filePath: url, customHeaders: headers)
    case .data(let data):
      return try? tusClient.upload(data: data, customHeaders: headers)
    }
  }

  /// Attempts to retry failed uploads or removes them if retry fails.
  ///
  /// This method processes all failed uploads:
  /// - Attempts to retry each failed upload
  /// - If retry fails, removes the upload from the TUS client's cache
  ///
  /// - Throws: An error if the TUS client operations fail.
  func handleFailedUploads() throws {
    for id in try tusClient.failedUploadIDs() where try tusClient.retry(id: id) == false {
      try tusClient.removeCacheFor(id: id)
    }
  }

  /// Restores uploads from previous sessions.
  ///
  /// This method:
  /// 1. Retrieves all stored uploads from the TUS client
  /// 2. Calculates the progress for each stored upload
  /// 3. Adds each upload back to the tracker with its current progress
  ///
  /// - Throws: An error if the TUS client operations fail.
  func handleStoredUploads() throws {
    let storedUploads = try tusClient.getStoredUploads()
    for storedUpload in storedUploads {
      let uploaded = storedUpload.uploadedRange?.upperBound ?? 0
      if let uploadVideoInfo = storedUpload.toUploadVideoInfo() {
        let status = UploadStatus.uploading(progress: .init(bytesUploaded: uploaded, totalBytes: storedUpload.size))
        uploadTracker.addUpload(info: uploadVideoInfo, status: status)
      }
    }
  }
}
