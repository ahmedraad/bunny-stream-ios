**EXTENSION**

# `URLSessionVideoUploader`
```swift
public extension URLSessionVideoUploader
```

## Methods
### `make(accessKey:)`

```swift
static func make(accessKey: String) -> URLSessionVideoUploader
```

Creates a preconfigured instance of URLSessionVideoUploader for use with BunnyCDN.

This factory method sets up a complete video uploader with:
- A default URLSession configuration
- Progress tracking through delegate callbacks
- Task management for upload control
- Request building for BunnyCDN's API

Example usage:
```swift
let uploader = URLSessionVideoUploader.make(accessKey: "your-bunny-cdn-key")
try await uploader.uploadVideo(with: myVideoInfo)
```

- Parameter accessKey: Your BunnyCDN API access key for authentication.
- Returns: A fully configured URLSessionVideoUploader instance ready for use.
- Note: The uploader uses the default URLSession configuration. For background
        uploads or custom configurations, create the uploader manually with
        the appropriate configuration.

#### Parameters

| Name | Description |
| ---- | ----------- |
| accessKey | Your BunnyCDN API access key for authentication. |

### `uploadVideos(with:)`

```swift
public func uploadVideos(with infos: [VideoInfo]) async throws
```

Uploads multiple videos using URLSession.

This method processes each video sequentially:
1. Creates an authenticated request
2. Initiates the upload task
3. Registers the upload with the tracker

- Parameter infos: An array of video information objects to upload.
- Throws: `VideoUploaderError.failedToCreateRequest` if request creation fails.
         `VideoUploaderError.invalidVideoUUID` if the video ID is invalid.

#### Parameters

| Name | Description |
| ---- | ----------- |
| infos | An array of video information objects to upload. |

### `pauseUpload(for:)`

```swift
public func pauseUpload(for info: UploadVideoInfo)
```

Pauses an ongoing upload.

This method suspends the URLSession task and updates the tracker
to reflect the paused state.

- Parameter info: The information about the upload to pause.

#### Parameters

| Name | Description |
| ---- | ----------- |
| info | The information about the upload to pause. |

### `resumeUpload(for:)`

```swift
public func resumeUpload(for info: UploadVideoInfo)
```

Resumes a previously paused upload.

This method resumes the URLSession task and updates the tracker
to reflect the resumed state.

- Parameter info: The information about the upload to resume.

#### Parameters

| Name | Description |
| ---- | ----------- |
| info | The information about the upload to resume. |

### `removeUpload(for:)`

```swift
public func removeUpload(for info: UploadVideoInfo)
```

Permanently removes an upload.

This method:
1. Removes the upload task from the task manager
2. Removes the upload from the tracker

- Parameter info: The information about the upload to remove.

#### Parameters

| Name | Description |
| ---- | ----------- |
| info | The information about the upload to remove. |

### `urlSession(_:task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:)`

```swift
public func urlSession(_ session: URLSession,
                       task: URLSessionTask,
                       didSendBodyData bytesSent: Int64,
                       totalBytesSent: Int64,
                       totalBytesExpectedToSend: Int64)
```

Handles upload progress updates from URLSession.

This delegate method is called periodically during the upload to report progress.
It updates the tracker with the current progress on the main thread.

- Parameters:
  - session: The session reporting the progress.
  - task: The upload task.
  - bytesSent: The number of bytes sent in the latest write operation.
  - totalBytesSent: The total number of bytes sent so far.
  - totalBytesExpectedToSend: The expected length of the body data.

#### Parameters

| Name | Description |
| ---- | ----------- |
| session | The session reporting the progress. |
| task | The upload task. |
| bytesSent | The number of bytes sent in the latest write operation. |
| totalBytesSent | The total number of bytes sent so far. |
| totalBytesExpectedToSend | The expected length of the body data. |