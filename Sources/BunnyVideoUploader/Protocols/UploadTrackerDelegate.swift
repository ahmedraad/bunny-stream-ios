import Foundation

public protocol UploadTrackerDelegate: AnyObject {
  func uploadTracker(_ tracker: UploadTracker, didUpdateUploadWithInfo info: UploadVideoInfo, toStatus status: UploadStatus)
}
