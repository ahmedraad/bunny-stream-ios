import Foundation

public protocol VideoUploaderActions {
  func pauseUpload(for info: UploadVideoInfo)
  func resumeUpload(for info: UploadVideoInfo)
  func removeUpload(for info: UploadVideoInfo)
}

