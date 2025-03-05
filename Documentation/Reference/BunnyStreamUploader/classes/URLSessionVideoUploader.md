**CLASS**

# `URLSessionVideoUploader`

```swift
public class URLSessionVideoUploader: NSObject
```

A video uploader implementation that uses URLSession for handling uploads.

`URLSessionVideoUploader` provides a standard HTTP-based implementation of video uploading
using URLSession. This implementation offers:
- Support for both file and data-based uploads
- Progress tracking
- Pause and resume capabilities
- Background upload support
- Automatic error handling and status updates

The uploader uses a task manager to keep track of ongoing upload tasks and
provides status updates through its upload tracker.

## Properties
### `uploadTracker`

```swift
public let uploadTracker: UploadTracker
```

The tracker that monitors the status of all uploads.
