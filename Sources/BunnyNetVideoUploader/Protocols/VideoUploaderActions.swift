import Foundation

public protocol VideoUploaderActions {
  func pauseUpload(for info: UploadVideoInfo) throws
  func resumeUpload(for info: UploadVideoInfo) throws
  func removeUpload(for info: UploadVideoInfo) throws
}

