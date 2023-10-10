import Foundation

public enum UploadStatus {
  case paused(progress: UploadProgress)
  case uploading(progress: UploadProgress)
  case failed(error: Error)
  case uploaded(url: URL)
}
