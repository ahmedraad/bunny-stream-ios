**CLASS**

# `UploadTrackerObservable`

```swift
public final class UploadTrackerObservable: ObservableObject, UploadTrackerDelegate
```

A SwiftUI-compatible wrapper for `UploadTracker` that provides observable upload status updates.

This class adapts the delegate-based `UploadTracker` to SwiftUI's data flow system by
implementing `ObservableObject`. It automatically updates the UI when upload statuses change,
making it easy to build reactive SwiftUI views that display upload progress.

Example usage:
```swift
struct UploadView: View {
    @StateObject private var tracker = UploadTrackerObservable(tracker: myTracker)

    var body: some View {
        List(tracker.uploads) { upload in
            UploadProgressView(upload: upload)
        }
    }
}
```

## Properties
### `uploads`

```swift
@Published public var uploads: [UploadVideoInfo: UploadStatus]
```

A published dictionary of upload statuses that triggers view updates when changed.

This property mirrors the uploads dictionary from the underlying tracker and
automatically updates when changes occur. SwiftUI views can observe this
property to reflect the current state of all uploads.

## Methods
### `init(tracker:)`

```swift
public init(tracker: UploadTracker)
```

Creates a new observable wrapper around an upload tracker.

This initializer sets up the observation of the tracker by becoming its delegate
and initializing the published uploads property with the current state.

- Parameter tracker: The upload tracker to observe.

#### Parameters

| Name | Description |
| ---- | ----------- |
| tracker | The upload tracker to observe. |

### `uploadTracker(_:didUpdateUploadWithInfo:toStatus:)`

```swift
public func uploadTracker(_ tracker: UploadTracker,
                          didUpdateUploadWithInfo info: UploadVideoInfo,
                          toStatus status: UploadStatus)
```

Updates the published uploads dictionary when the tracker reports changes.

This method ensures that all updates happen on the main thread and are
animated appropriately in the UI.

- Parameters:
  - tracker: The tracker reporting the update.
  - info: The upload information that was updated.
  - status: The new status of the upload.

#### Parameters

| Name | Description |
| ---- | ----------- |
| tracker | The tracker reporting the update. |
| info | The upload information that was updated. |
| status | The new status of the upload. |