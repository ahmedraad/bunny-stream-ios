import Foundation

/// A class that manages and tracks the status of multiple video uploads.
///
/// `UploadTracker` serves as a central registry for monitoring the progress and state of
/// video uploads. It maintains a mapping between upload information and their current status,
/// and provides methods to control individual uploads (pause, resume, remove).
///
/// The tracker uses a delegate pattern to notify interested parties about status changes,
/// making it suitable for updating UI or triggering other actions based on upload progress.
public class UploadTracker {
  /// A dictionary mapping upload information to their current status.
  ///
  /// This property provides read-only access to the current state of all tracked uploads.
  /// The status of uploads should only be modified through the provided methods.
  public private(set) var uploads: [UploadVideoInfo: UploadStatus] = [:]

  /// The delegate that receives notifications about upload status changes.
  ///
  /// The delegate is held weakly to avoid retain cycles. When the status of any upload
  /// changes, the delegate is notified through the `UploadTrackerDelegate` protocol methods.
  weak var delegate: UploadTrackerDelegate?

  /// Adds a new upload to the tracker with its initial status.
  ///
  /// This method registers a new upload with the tracker and immediately notifies
  /// the delegate about the initial status.
  ///
  /// - Parameters:
  ///   - info: The upload information that uniquely identifies this upload.
  ///   - status: The initial status of the upload.
  func addUpload(info: UploadVideoInfo, status: UploadStatus) {
    handleUpdates(for: info, status: status)
  }

  /// Pauses an ongoing upload.
  ///
  /// This method attempts to pause an active upload. The operation only succeeds if
  /// the upload exists and is currently in the uploading state. When successful,
  /// the upload's status is updated to paused with the current progress preserved.
  ///
  /// - Parameter id: The unique identifier of the upload to pause.
  func pauseUpload(id: UUID) {
    if let info = findVideoInfo(for: id), case let .uploading(progress) = uploads[info] {
      let status = UploadStatus.paused(progress: progress)
      handleUpdates(for: info, status: status)
    }
  }

  /// Resumes a previously paused upload.
  ///
  /// This method attempts to resume a paused upload. The operation only succeeds if
  /// the upload exists and is currently in the paused state. When successful,
  /// the upload's status is updated to uploading with the previous progress preserved.
  ///
  /// - Parameter id: The unique identifier of the upload to resume.
  func resumeUpload(id: UUID) {
    if let info = findVideoInfo(for: id), case let .paused(progress) = uploads[info] {
      let status = UploadStatus.uploading(progress: progress)
      handleUpdates(for: info, status: status)
    }
  }

  /// Removes an upload from the tracker.
  ///
  /// This method removes all tracking information for the specified upload and notifies
  /// the delegate that the upload has been removed. This operation cannot be undone.
  ///
  /// - Parameter id: The unique identifier of the upload to remove.
  func removeUpload(id: UUID) {
    if let info = findVideoInfo(for: id) {
      uploads[info] = nil
      delegate?.uploadTracker(self, didUpdateUploadWithInfo: info, toStatus: .removed)
    }
  }

  /// Updates the status of an existing upload.
  ///
  /// This method updates the status of an upload if it exists in the tracker. Unlike
  /// `addUpload`, this method will not create a new upload if the ID is not found.
  ///
  /// - Parameters:
  ///   - id: The unique identifier of the upload to update.
  ///   - status: The new status to set for the upload.
  func addOrUpdateUpload(id: UUID, status: UploadStatus) {
    if let info = findVideoInfo(for: id) {
      handleUpdates(for: info, status: status)
    }
  }
}

private extension UploadTracker {
  /// Finds the upload information associated with a given UUID.
  ///
  /// This helper method searches through the tracked uploads to find the one
  /// matching the provided UUID.
  ///
  /// - Parameter id: The UUID to search for.
  /// - Returns: The matching `UploadVideoInfo` if found, nil otherwise.
  func findVideoInfo(for id: UUID) -> UploadVideoInfo? {
    uploads.keys.first { $0.uuid == id }
  }

  /// Updates the status of an upload and notifies the delegate.
  ///
  /// This helper method handles the common task of updating an upload's status
  /// and ensuring the delegate is notified of the change.
  ///
  /// - Parameters:
  ///   - info: The upload information to update.
  ///   - status: The new status to set.
  func handleUpdates(for info: UploadVideoInfo, status: UploadStatus) {
    uploads[info] = status
    delegate?.uploadTracker(self, didUpdateUploadWithInfo: info, toStatus: status)
  }
}
