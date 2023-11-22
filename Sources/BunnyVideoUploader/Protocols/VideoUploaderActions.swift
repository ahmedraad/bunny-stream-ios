import Foundation

public protocol VideoUploaderActions {
  /// Pause the video file being uploaded
  /// - Parameter info: specific video info
  func pauseUpload(for info: UploadVideoInfo) throws
  
  /// Resume the video that is paused
  /// - Parameter info: specific video info
  func resumeUpload(for info: UploadVideoInfo) throws
  
  /// Remove the uploading the video
  /// - Parameter info: specific video info
  func removeUpload(for info: UploadVideoInfo) throws
}

