import Foundation

public protocol VideoUploader {
  /// Upload video files to server
  /// - Parameter infos: multiple video informations
  func uploadVideos(with infos: [VideoInfo]) async throws
}
