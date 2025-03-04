import Foundation

/// Factory methods for creating URLSessionVideoUploader instances.
public extension URLSessionVideoUploader {
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
