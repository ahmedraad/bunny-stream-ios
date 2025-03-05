**CLASS**

# `UploadTracker`

```swift
public class UploadTracker
```

A class that manages and tracks the status of multiple video uploads.

`UploadTracker` serves as a central registry for monitoring the progress and state of
video uploads. It maintains a mapping between upload information and their current status,
and provides methods to control individual uploads (pause, resume, remove).

The tracker uses a delegate pattern to notify interested parties about status changes,
making it suitable for updating UI or triggering other actions based on upload progress.

## Properties
### `uploads`

```swift
public private(set) var uploads: [UploadVideoInfo: UploadStatus] = [:]
```

A dictionary mapping upload information to their current status.

This property provides read-only access to the current state of all tracked uploads.
The status of uploads should only be modified through the provided methods.
