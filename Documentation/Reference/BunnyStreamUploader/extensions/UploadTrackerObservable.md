**EXTENSION**

# `UploadTrackerObservable`
```swift
extension UploadTrackerObservable: UploadTrackerDelegate
```

## Methods
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