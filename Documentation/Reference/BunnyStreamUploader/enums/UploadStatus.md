**ENUM**

# `UploadStatus`

```swift
public enum UploadStatus: Equatable
```

An enumeration representing the various states of a video upload.

`UploadStatus` provides a comprehensive way to track the current state of a video upload,
including progress information for active uploads, error details for failed uploads,
and success information for completed uploads.

## Cases
### `paused(progress:)`

```swift
case paused(progress: UploadProgress)
```

Indicates that the upload has been paused by the user or the system.

- Parameter progress: The `UploadProgress` at the time the upload was paused.

### `uploading(progress:)`

```swift
case uploading(progress: UploadProgress)
```

Indicates that the upload is currently in progress.

- Parameter progress: The current `UploadProgress` of the upload.

### `failed(error:)`

```swift
case failed(error: String)
```

Indicates that the upload has failed.

- Parameter error: A string describing the error that caused the upload to fail.

### `uploaded(url:)`

```swift
case uploaded(url: URL)
```

Indicates that the upload has completed successfully.

- Parameter url: The URL where the uploaded video can be accessed.

### `removed`

```swift
case removed
```

Indicates that the upload has been removed from the queue.

This status is used when an upload is manually cancelled and removed by the user.
