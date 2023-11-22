import Foundation

public extension URLSessionVideoUploader {
  /// Upload video files using URLSession
  /// - Parameter accessKey: Bunny net access key
  /// - Returns: URLSessionVideoUploader instance
  static func make(accessKey: String) -> URLSessionVideoUploader {
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
}
