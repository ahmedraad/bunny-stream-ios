import Foundation

/// A protocol defining the delegate methods for `UploadTracker`.
public protocol UploadTrackerDelegate: AnyObject {
  /// Notifies the delegate when an upload's status has been updated.
  ///
  /// This method is called when an upload's status changes, allowing the delegate to respond to
  /// different upload states like paused, resumed, or completed.
  ///
  /// - Parameters:
  ///   - tracker: The `UploadTracker` instance reporting the update.
  ///   - info: The `UploadVideoInfo` that identifies the upload.
  ///   - status: The new `UploadStatus` of the upload.
  func uploadTracker(_ tracker: UploadTracker, didUpdateUploadWithInfo info: UploadVideoInfo, toStatus status: UploadStatus)
}
