import Foundation
import SwiftUI

/// A SwiftUI-compatible wrapper for `UploadTracker` that provides observable upload status updates.
///
/// This class adapts the delegate-based `UploadTracker` to SwiftUI's data flow system by
/// implementing `ObservableObject`. It automatically updates the UI when upload statuses change,
/// making it easy to build reactive SwiftUI views that display upload progress.
///
/// Example usage:
/// ```swift
/// struct UploadView: View {
///     @StateObject private var tracker = UploadTrackerObservable(tracker: myTracker)
///
///     var body: some View {
///         List(tracker.uploads) { upload in
///             UploadProgressView(upload: upload)
///         }
///     }
/// }
/// ```
public final class UploadTrackerObservable: ObservableObject, UploadTrackerDelegate {
  /// The underlying upload tracker being observed.
  private var tracker: UploadTracker

  /// A published dictionary of upload statuses that triggers view updates when changed.
  ///
  /// This property mirrors the uploads dictionary from the underlying tracker and
  /// automatically updates when changes occur. SwiftUI views can observe this
  /// property to reflect the current state of all uploads.
  @Published public var uploads: [UploadVideoInfo: UploadStatus]

  /// Creates a new observable wrapper around an upload tracker.
  ///
  /// This initializer sets up the observation of the tracker by becoming its delegate
  /// and initializing the published uploads property with the current state.
  ///
  /// - Parameter tracker: The upload tracker to observe.
  public init(tracker: UploadTracker) {
    self.tracker = tracker
    self.uploads = tracker.uploads
    self.tracker.delegate = self
  }

  /// Updates the published uploads dictionary when the tracker reports changes.
  ///
  /// This method ensures that all updates happen on the main thread and are
  /// animated appropriately in the UI.
  ///
  /// - Parameters:
  ///   - tracker: The tracker reporting the update.
  ///   - info: The upload information that was updated.
  ///   - status: The new status of the upload.
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
