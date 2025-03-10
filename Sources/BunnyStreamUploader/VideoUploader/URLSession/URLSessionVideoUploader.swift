import Foundation

/// A video uploader implementation that uses URLSession for handling uploads.
///
/// `URLSessionVideoUploader` provides a standard HTTP-based implementation of video uploading
/// using URLSession. This implementation offers:
/// - Support for both file and data-based uploads
/// - Progress tracking
/// - Pause and resume capabilities
/// - Background upload support
/// - Automatic error handling and status updates
///
/// The uploader uses a task manager to keep track of ongoing upload tasks and
/// provides status updates through its upload tracker.
public class URLSessionVideoUploader: NSObject, VideoUploadable, VideoUploaderActions, URLSessionDataDelegate {
  /// The tracker that monitors the status of all uploads.
  public let uploadTracker: UploadTracker

  /// The builder responsible for creating upload requests.
  private let requestBuilder: RequestBuilder

  /// The API access key used for request authentication.
  private let accessKey: String

  /// The URLSession instance (or mock) used for network operations.
  private var session: URLSessionProtocol?

  /// The manager responsible for tracking and controlling upload tasks.
  private let taskManager: URLSessionTaskManager

  /// Creates a new URLSession-based video uploader instance.
  ///
  /// - Parameters:
  ///   - uploadTracker: The tracker that will monitor upload progress.
  ///   - requestBuilder: The builder that will create upload requests.
  ///   - accessKey: The API access key for authentication.
  ///   - session: The URLSession instance or mock for network operations.
  ///   - taskManager: The manager that will track upload tasks.
  init(uploadTracker: UploadTracker,
       requestBuilder: RequestBuilder,
       accessKey: String,
       session: URLSessionProtocol?,
       taskManager: URLSessionTaskManager) {
    self.uploadTracker = uploadTracker
    self.requestBuilder = requestBuilder
    self.accessKey = accessKey
    self.session = session
    self.taskManager = taskManager
  }

  /// Creates a preconfigured instance of URLSessionVideoUploader for use with BunnyCDN.
  ///
  /// This factory method sets up a complete video uploader with:
  /// - A default URLSession configuration
  /// - Progress tracking through delegate callbacks
  /// - Task management for upload control
  /// - Request building for BunnyCDN's API
  ///
  /// Example usage:
  /// ```swift
  /// let uploader = URLSessionVideoUploader.make(accessKey: "your-bunny-cdn-key")
  /// try await uploader.uploadVideo(with: myVideoInfo)
  /// ```
  ///
  /// - Parameter accessKey: Your BunnyCDN API access key for authentication.
  /// - Returns: A fully configured URLSessionVideoUploader instance ready for use.
  /// - Note: The uploader uses the default URLSession configuration. For background
  ///         uploads or custom configurations, create the uploader manually with
  ///         the appropriate configuration.
  public static func make(accessKey: String) -> URLSessionVideoUploader {
    let uploadTracker = UploadTracker()

    let videoUploader = URLSessionVideoUploader(uploadTracker: uploadTracker,
                                                requestBuilder: URLSessionRequestBuilder(),
                                                accessKey: accessKey,
                                                session: nil,
                                                taskManager: URLSessionTaskManager())

    let session = URLSession(configuration: .default, delegate: videoUploader, delegateQueue: nil)
    videoUploader.setURLSession(session)

    return videoUploader
  }

  // MARK: - Video Uploadable
  /// Uploads multiple videos using URLSession.
  ///
  /// This method processes each video sequentially:
  /// 1. Creates an authenticated request
  /// 2. Initiates the upload task
  /// 3. Registers the upload with the tracker
  ///
  /// - Parameter infos: An array of video information objects to upload.
  /// - Throws: `VideoUploaderError.failedToCreateRequest` if request creation fails.
  ///          `VideoUploaderError.invalidVideoUUID` if the video ID is invalid.
  public func uploadVideos(with infos: [VideoInfo]) async throws {
    for info in infos {
      guard let request = requestBuilder.createRequest(for: info, with: accessKey) else {
        throw VideoUploaderError.failedToCreateRequest
      }

      let uuid = try initiateUpload(for: info, with: request)

      guard let videoUUIDInstance = UUID(uuidString: info.videoId) else {
        throw VideoUploaderError.invalidVideoUUID
      }

      let uploadVideoInfo = UploadVideoInfo(uuid: uuid, videoUUID: videoUUIDInstance, info: info)
      uploadTracker.addUpload(info: uploadVideoInfo, status: .uploading(progress: .zero))
    }
  }

  /// Sets the URLSession instance to be used for uploads.
  ///
  /// - Parameter session: The URLSession instance or mock to use.
  func setURLSession(_ session: URLSessionProtocol) {
    self.session = session
  }

  // MARK: - VideoUploaderActions
  /// Pauses an ongoing upload.
  ///
  /// This method suspends the URLSession task and updates the tracker
  /// to reflect the paused state.
  ///
  /// - Parameter info: The information about the upload to pause.
  public func pauseUpload(for info: UploadVideoInfo) {
    let uuid = info.uuid
    taskManager.suspendTask(for: uuid)
    uploadTracker.pauseUpload(id: uuid)
  }

  /// Resumes a previously paused upload.
  ///
  /// This method resumes the URLSession task and updates the tracker
  /// to reflect the resumed state.
  ///
  /// - Parameter info: The information about the upload to resume.
  public func resumeUpload(for info: UploadVideoInfo) {
    let uuid = info.uuid
    taskManager.resumeTask(for: uuid)
    uploadTracker.resumeUpload(id: uuid)
  }

  /// Permanently removes an upload.
  ///
  /// This method:
  /// 1. Removes the upload task from the task manager
  /// 2. Removes the upload from the tracker
  ///
  /// - Parameter info: The information about the upload to remove.
  public func removeUpload(for info: UploadVideoInfo) {
    let uuid = info.uuid
    taskManager.removeTask(for: uuid)
    uploadTracker.removeUpload(id: uuid)
  }

  // MARK: - URLSessionDataDelegate
  /// Handles upload progress updates from URLSession.
  ///
  /// This delegate method is called periodically during the upload to report progress.
  /// It updates the tracker with the current progress on the main thread.
  ///
  /// - Parameters:
  ///   - session: The session reporting the progress.
  ///   - task: The upload task.
  ///   - bytesSent: The number of bytes sent in the latest write operation.
  ///   - totalBytesSent: The total number of bytes sent so far.
  ///   - totalBytesExpectedToSend: The expected length of the body data.
  public func urlSession(_ session: URLSession,
                         task: URLSessionTask,
                         didSendBodyData bytesSent: Int64,
                         totalBytesSent: Int64,
                         totalBytesExpectedToSend: Int64) {
    guard let uuid = task.taskDescription.flatMap({ UUID(uuidString: $0) }) else { return }

    DispatchQueue.main.async {
      let progress = UploadProgress(bytesUploaded: Int(totalBytesSent), totalBytes: Int(totalBytesExpectedToSend))
      let status = UploadStatus.uploading(progress: progress)
      self.uploadTracker.addOrUpdateUpload(id: uuid, status: status)
    }
  }
}

// MARK: - Private methods
private extension URLSessionVideoUploader {
  /// Initiates a new upload task for the given video information.
  ///
  /// This method creates and configures a URLSession upload task based on
  /// the video content type (file or data).
  ///
  /// - Parameters:
  ///   - info: The video information to upload.
  ///   - request: The prepared URLRequest for the upload.
  /// - Returns: A UUID that uniquely identifies the upload task.
  /// - Throws: `VideoUploaderError.failedToCreateUploadTask` if task creation fails.
  func initiateUpload(for info: VideoInfo, with request: URLRequest) throws -> UUID {
    let uuid = UUID()

    switch info.content {
    case .url(let url):
      guard let task = session?.customUploadTask(with: request, fromFile: url, completionHandler: handleUploadCompletion(for: uuid)) else {
        throw VideoUploaderError.failedToCreateUploadTask
      }
      (task as? URLSessionUploadTask)?.taskDescription = uuid.uuidString
      taskManager.addTask(for: uuid, task: task)

    case .data(let data):
      guard let task = session?.customUploadTask(with: request, from: data, completionHandler: handleUploadCompletion(for: uuid)) else {
        throw VideoUploaderError.failedToCreateUploadTask
      }
      (task as? URLSessionUploadTask)?.taskDescription = uuid.uuidString
      taskManager.addTask(for: uuid, task: task)
    }

    return uuid
  }

  /// Creates a completion handler for an upload task.
  ///
  /// This method returns a closure that processes the upload result and
  /// updates the tracker accordingly:
  /// - Handles network errors
  /// - Validates HTTP response codes
  /// - Updates the tracker with success or failure status
  ///
  /// - Parameter uuid: The UUID of the upload task.
  /// - Returns: A completion handler closure.
  func handleUploadCompletion(for uuid: UUID) -> (Data?, URLResponse?, Error?) -> Void {
    return { [weak self] data, response, error in
      if let error = error {
        let status = UploadStatus.failed(error: error.localizedDescription)
        self?.uploadTracker.addOrUpdateUpload(id: uuid, status: status)
        return
      }

      if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
        let status = UploadStatus.failed(error: VideoUploaderError.failedToUploadVideo.localizedDescription)
        self?.uploadTracker.addOrUpdateUpload(id: uuid, status: status)
        return
      }

      // successful upload, updating the tracker
      guard let url = response?.url else { return }
      let status = UploadStatus.uploaded(url: url)
      self?.uploadTracker.addOrUpdateUpload(id: uuid, status: status)
    }
  }
}
