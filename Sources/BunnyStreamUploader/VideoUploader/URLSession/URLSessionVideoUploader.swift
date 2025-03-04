import Foundation

/// VideoUploader concrete implementation using URLSession
public class URLSessionVideoUploader: NSObject {
  public let uploadTracker: UploadTracker
  private let requestBuilder: RequestBuilder
  private let accessKey: String
  private var session: URLSessionProtocol?
  private let taskManager: URLSessionTaskManager
  
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
}

extension URLSessionVideoUploader: VideoUploadable {
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
  
  func setURLSession(_ session: URLSessionProtocol) {
    self.session = session
  }
}

// MARK: - VideoUploaderActions
extension URLSessionVideoUploader: VideoUploaderActions {
  public func pauseUpload(for info: UploadVideoInfo) {
    let uuid = info.uuid
    taskManager.suspendTask(for: uuid)
    uploadTracker.pauseUpload(id: uuid)
  }
  
  public func resumeUpload(for info: UploadVideoInfo) {
    let uuid = info.uuid
    taskManager.resumeTask(for: uuid)
    uploadTracker.resumeUpload(id: uuid)
  }
  
  public func removeUpload(for info: UploadVideoInfo) {
    let uuid = info.uuid
    taskManager.removeTask(for: uuid)
    uploadTracker.removeUpload(id: uuid)
  }
}

// MARK: - Private methods
private extension URLSessionVideoUploader {
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

extension URLSessionVideoUploader: URLSessionDataDelegate {
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
