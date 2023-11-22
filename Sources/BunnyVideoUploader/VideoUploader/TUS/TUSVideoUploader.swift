import Foundation
import TUSKit

public final class TUSVideoUploader {
  public let uploadTracker: UploadTracker
  private let tusClient: TUSClient
  private let videoSigner: VideoSHA256Signer
  private let videoRequestHeaderBuilder: VideoRequestHeaderBuilder
  private let accessKey: String
  
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
  public func pauseUpload(for info: UploadVideoInfo) throws {
    try tusClient.cancel(id: info.uuid)
    uploadTracker.pauseUpload(id: info.uuid)
  }
  
  public func resumeUpload(for info: UploadVideoInfo) throws {
    _ = try tusClient.resume(id: info.uuid)
    uploadTracker.resumeUpload(id: info.uuid)
  }
  
  public func removeUpload(for info: UploadVideoInfo) throws {
    _ = try tusClient.cancel(id: info.uuid)
    _ = try tusClient.removeCacheFor(id: info.uuid)
    uploadTracker.removeUpload(id: info.uuid)
  }
}

// MARK: - Public methods
public extension TUSVideoUploader {
  func start() throws {
    _ = tusClient.start()
    
    try? handleFailedUploads()
    try? handleStoredUploads()
    
    tusClient.cleanup()
  }
  
  func registerBackgroundHandler(_ handler: @escaping () -> Void,
                                 forSession sessionIdentifier: String) {
    tusClient.registerBackgroundHandler(handler, forSession: sessionIdentifier)
  }
}

// MARK: - TUSClientDelegate
extension TUSVideoUploader: TUSClientDelegate {
  public func progressFor(id: UUID, context: [String: String]?, bytesUploaded: Int, totalBytes: Int, client: TUSClient) {
    let status = UploadStatus.uploading(progress: .init(bytesUploaded: bytesUploaded, totalBytes: totalBytes))
    uploadTracker.addOrUpdateUpload(id: id, status: status)
  }
  
  public func didStartUpload(id: UUID, context: [String : String]?, client: TUSClient) {
    let status = UploadStatus.uploading(progress: .init(bytesUploaded: 0, totalBytes: Int.max))
    uploadTracker.addOrUpdateUpload(id: id, status: status)
  }
  
  public func didFinishUpload(id: UUID, url: URL, context: [String : String]?, client: TUSClient) {
    let status = UploadStatus.uploaded(url: url)
    uploadTracker.addOrUpdateUpload(id: id, status: status)
  }
  
  public func uploadFailed(id: UUID, error: Error, context: [String : String]?, client: TUSClient) {
    let status = UploadStatus.failed(error: error.localizedDescription)
    uploadTracker.addOrUpdateUpload(id: id, status: status)
  }
  
  public func fileError(error: TUSClientError, client: TUSClient) { }
  
  public func totalProgress(bytesUploaded: Int, totalBytes: Int, client: TUSClient) { }
}

// MARK: - Private methods
private extension TUSVideoUploader {
  func prepareHeaders(for info: VideoInfo) -> Headers {
    let signature = videoSigner.sign(info: info, apiKey: accessKey)
    return videoRequestHeaderBuilder.buildHeaders(for: info, signature: signature)
  }
  
  func uploadContent(from info: VideoInfo, headers: Headers) -> UUID? {
    switch info.content {
    case .url(let url):
      return try? tusClient.uploadFileAt(filePath: url, customHeaders: headers)
    case .data(let data):
      return try? tusClient.upload(data: data, customHeaders: headers)
    }
  }
  
  func handleFailedUploads() throws {
    for id in try tusClient.failedUploadIDs() where try tusClient.retry(id: id) == false {
      try tusClient.removeCacheFor(id: id)
    }
  }
  
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
