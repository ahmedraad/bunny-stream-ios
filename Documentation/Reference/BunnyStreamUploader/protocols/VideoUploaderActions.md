**PROTOCOL**

# `VideoUploaderActions`

```swift
public protocol VideoUploaderActions
```

A protocol that defines control actions for managing video uploads.

This protocol provides a set of methods to control the upload process of individual videos,
including the ability to pause, resume, and remove uploads in progress.

## Methods
### `pauseUpload(for:)`

```swift
func pauseUpload(for info: UploadVideoInfo) throws
```

Pauses an ongoing video upload.

This method temporarily halts the upload process for a specific video. The upload
can be resumed later using `resumeUpload(for:)`.

- Parameter info: The `UploadVideoInfo` object representing the video upload to pause.
- Throws: An error if the upload cannot be paused or if the video is not currently uploading.

#### Parameters

| Name | Description |
| ---- | ----------- |
| info | The `UploadVideoInfo` object representing the video upload to pause. |

### `resumeUpload(for:)`

```swift
func resumeUpload(for info: UploadVideoInfo) throws
```

Resumes a previously paused video upload.

This method continues the upload process from where it was paused. If the upload
was not previously paused, this method may throw an error.

- Parameter info: The `UploadVideoInfo` object representing the video upload to resume.
- Throws: An error if the upload cannot be resumed or if the video was not in a paused state.

#### Parameters

| Name | Description |
| ---- | ----------- |
| info | The `UploadVideoInfo` object representing the video upload to resume. |

### `removeUpload(for:)`

```swift
func removeUpload(for info: UploadVideoInfo) throws
```

Removes a video from the upload queue and cancels any ongoing upload.

This method permanently cancels the upload process for a specific video and removes it
from the upload tracker. Any partially uploaded data may be lost.

- Parameter info: The `UploadVideoInfo` object representing the video upload to remove.
- Throws: An error if the upload cannot be removed or if the video is not found in the upload queue.

#### Parameters

| Name | Description |
| ---- | ----------- |
| info | The `UploadVideoInfo` object representing the video upload to remove. |