import Foundation
import SwiftUI

/// ObservableObject SwiftUI helper class
public final class UploadTrackerObservable: ObservableObject {
  private var tracker: UploadTracker
  
  @Published public var uploads: [UploadVideoInfo: UploadStatus]
  
  public init(tracker: UploadTracker) {
    self.tracker = tracker
    self.uploads = tracker.uploads
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
