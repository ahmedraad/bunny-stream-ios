import Foundation

/// `UploadTracker` keeps track of the upload status of video files.
public class UploadTracker {
  /// A dictionary mapping `UploadVideoInfo` to its corresponding `UploadStatus`.
  public private(set) var uploads: [UploadVideoInfo: UploadStatus] = [:]
  
  /// A weak delegate reference used to notify about upload status changes.
  weak var delegate: UploadTrackerDelegate?
  
  /// Adds a new upload with its initial status to the tracker.
  ///
  /// - Parameters:
  ///   - info: The `UploadVideoInfo` identifying the upload.
  ///   - status: The initial `UploadStatus` of the upload.
  func addUpload(info: UploadVideoInfo, status: UploadStatus) {
    handleUpdates(for: info, status: status)
  }
  
  /// Pauses an ongoing upload.
  ///
  /// - Parameter id: The `UUID` of the upload to pause.
  func pauseUpload(id: UUID) {
    if let info = findVideoInfo(for: id), case let .uploading(progress) = uploads[info] {
      let status = UploadStatus.paused(progress: progress)
      handleUpdates(for: info, status: status)
    }
  }
  
  /// Resumes a paused upload.
  ///
  /// - Parameter id: The `UUID` of the upload to resume.
  func resumeUpload(id: UUID) {
    if let info = findVideoInfo(for: id), case let .paused(progress) = uploads[info] {
      let status = UploadStatus.uploading(progress: progress)
      handleUpdates(for: info, status: status)
    }
  }
  
  /// Removes an upload from the tracker.
  ///
  /// - Parameter id: The `UUID` of the upload to remove.
  func removeUpload(id: UUID) {
    if let info = findVideoInfo(for: id) {
      uploads[info] = nil
      delegate?.uploadTracker(self, didUpdateUploadWithInfo: info, toStatus: .removed)
    }
  }
  
  /// Updates the status of an existing upload, or adds a new upload if it doesn't exist.
  ///
  /// - Parameters:
  ///   - id: The `UUID` of the upload to update.
  ///   - status: The new `UploadStatus` of the upload.
  func addOrUpdateUpload(id: UUID, status: UploadStatus) {
    if let info = findVideoInfo(for: id) {
      handleUpdates(for: info, status: status)
    }
  }
}

private extension UploadTracker {
  func findVideoInfo(for id: UUID) -> UploadVideoInfo? {
    uploads.keys.first { $0.uuid == id }
  }
  
  func handleUpdates(for info: UploadVideoInfo, status: UploadStatus) {
    uploads[info] = status
    delegate?.uploadTracker(self, didUpdateUploadWithInfo: info, toStatus: status)
  }
}
