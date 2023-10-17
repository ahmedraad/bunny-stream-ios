import Foundation

public typealias VideoUploader = VideoUploadable & VideoUploaderActions

public protocol VideoUploadable {
  /// Upload tracker for video files
  var uploadTracker: UploadTracker { get }
  
  /// Upload video files to server
  /// - Parameter infos: multiple video informations
  func uploadVideos(with infos: [VideoInfo]) async throws
}

public extension VideoUploadable {
  /// Upload a single video file
  /// - Parameter info: a video information
  func uploadVideo(with info: VideoInfo) async throws {
    try await uploadVideos(with: [info])
  }
}
