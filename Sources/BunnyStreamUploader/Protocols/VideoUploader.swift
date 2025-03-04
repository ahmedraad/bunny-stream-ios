import Foundation

/// A type that combines video uploading capabilities with upload control actions.
///
/// The `VideoUploader` typealias combines the core uploading functionality from `VideoUploadable`
/// with the control actions from `VideoUploaderActions` to provide a complete video uploading interface.
public typealias VideoUploader = VideoUploadable & VideoUploaderActions

/// A protocol that defines the core functionality for uploading videos to a server.
///
/// Conforming types must provide an upload tracking mechanism and the ability to upload
/// multiple videos simultaneously.
public protocol VideoUploadable {
  /// The upload tracker responsible for monitoring and managing video upload progress.
  ///
  /// The upload tracker maintains the state of all ongoing uploads and provides
  /// progress updates through its delegate pattern.
  var uploadTracker: UploadTracker { get }
  
  /// Uploads multiple video files to the server.
  ///
  /// This method handles the concurrent upload of multiple video files. It will attempt to
  /// upload all videos and may throw an error if any of the uploads fail.
  ///
  /// - Parameter infos: An array of `VideoInfo` objects containing the metadata and file information
  ///                   for each video to be uploaded.
  /// - Throws: An error if the upload process fails for any reason.
  func uploadVideos(with infos: [VideoInfo]) async throws
}

public extension VideoUploadable {
  /// Uploads a single video file to the server.
  ///
  /// This convenience method wraps the multi-video upload functionality to provide
  /// a simpler interface for single video uploads. It internally calls `uploadVideos(with:)`
  /// with a single-element array.
  ///
  /// - Parameter info: A `VideoInfo` object containing the metadata and file information
  ///                  for the video to be uploaded.
  /// - Throws: An error if the upload process fails for any reason.
  func uploadVideo(with info: VideoInfo) async throws {
    try await uploadVideos(with: [info])
  }
}
