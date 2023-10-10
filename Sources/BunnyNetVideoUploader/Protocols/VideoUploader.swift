import Foundation

public protocol VideoUploader {
  /// Upload video files to server
  /// - Parameter infos: multiple video informations
  /// - Returns: result of uploading videos with info
  func uploadFiles(with infos: [VideoInfo]) async throws -> [ResultVideoInfo]
}
