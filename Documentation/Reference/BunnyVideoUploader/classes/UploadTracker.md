**CLASS**

# `UploadTracker`

```swift
public class UploadTracker
```

`UploadTracker` keeps track of the upload status of video files.

## Properties
### `uploads`

```swift
public private(set) var uploads: [UploadVideoInfo: UploadStatus] = [:]
```

A dictionary mapping `UploadVideoInfo` to its corresponding `UploadStatus`.
