import Foundation
import SwiftUI

public final class UploadTrackerObservable: ObservableObject {
  private var tracker: UploadTracker
  
  @Published public var uploads: [UploadVideoInfo: UploadStatus]
  
  public init(tracker: UploadTracker, uploads: [UploadVideoInfo: UploadStatus] = [:]) {
    self.tracker = tracker
    self.uploads = uploads
    self.tracker.delegate = self
  }
}

extension UploadTrackerObservable: UploadTrackerDelegate {
  public func uploadTracker(_ tracker: UploadTracker,
                            didUpdateUploadWithInfo info: UploadVideoInfo,
                            toStatus status: UploadStatus) {
    DispatchQueue.main.async {
      withAnimation {
        self.uploads[info] = status
      }
    }
  }
}
