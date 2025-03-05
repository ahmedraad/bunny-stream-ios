**CLASS**

# `TUSVideoUploader`

```swift
public final class TUSVideoUploader
```

A video uploader implementation that uses the TUS protocol for reliable file uploads.

`TUSVideoUploader` provides a robust implementation of video uploading using the TUS (Transloadit Upload Service)
protocol, which supports resumable uploads. This implementation handles:
- Chunked file uploads
- Upload progress tracking
- Pause and resume capabilities
- Background upload support
- Automatic retry of failed uploads

The uploader integrates with the TUSKit framework to handle the low-level TUS protocol
implementation while providing a high-level interface for video uploads.

## Properties
### `uploadTracker`

```swift
public let uploadTracker: UploadTracker
```

The tracker that monitors the status of all uploads.
