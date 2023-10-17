import Foundation

public class UploadTracker {
  public private(set) var uploads: [UploadVideoInfo: UploadStatus] = [:]
  weak var delegate: UploadTrackerDelegate?
  
  func addUpload(info: UploadVideoInfo, status: UploadStatus) {
    handleUpdates(for: info, status: status)
  }
  
  func pauseUpload(id: UUID) {
    if let info = findVideoInfo(for: id), case let .uploading(progress) = uploads[info] {
      let status = UploadStatus.paused(progress: progress)
      handleUpdates(for: info, status: status)
    }
  }
  
  func resumeUpload(id: UUID) {
    if let info = findVideoInfo(for: id), case let .paused(progress) = uploads[info] {
      let status = UploadStatus.uploading(progress: progress)
      handleUpdates(for: info, status: status)
    }
  }
  
  func removeUpload(id: UUID) {
    if let info = findVideoInfo(for: id) {
      uploads[info] = nil
      delegate?.uploadTracker(self, didUpdateUploadWithInfo: info, toStatus: .removed)
    }
  }
  
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
