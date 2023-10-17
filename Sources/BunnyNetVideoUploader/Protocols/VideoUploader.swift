import Foundation

public typealias VideoUploader = VideoUploadable & VideoUploaderActions

public protocol VideoUploadable {
  /// Upload tracker for video files
  var uploadTracker: UploadTracker { get }
  
  /// Upload video files to server
  /// - Parameter infos: multiple video informations
  func uploadVideos(with infos: [VideoInfo]) async throws
}
