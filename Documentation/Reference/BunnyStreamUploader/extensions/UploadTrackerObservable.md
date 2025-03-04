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

#### Parameters

| Name | Description |
| ---- | ----------- |
| tracker | The `UploadTracker` instance reporting the update. |
| info | The `UploadVideoInfo` that identifies the upload. |
| status | The new `UploadStatus` of the upload. |