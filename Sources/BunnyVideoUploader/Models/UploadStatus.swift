import Foundation

public enum UploadStatus: Equatable {
  case paused(progress: UploadProgress)
  case uploading(progress: UploadProgress)
  case failed(error: String)
  case uploaded(url: URL)
  case removed
}
