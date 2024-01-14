**PROTOCOL**

# `VideoUploaderActions`

```swift
public protocol VideoUploaderActions
```

## Methods
### `pauseUpload(for:)`

```swift
func pauseUpload(for info: UploadVideoInfo) throws
```

Pause the video file being uploaded
- Parameter info: specific video info

#### Parameters

| Name | Description |
| ---- | ----------- |
| info | specific video info |

### `resumeUpload(for:)`

```swift
func resumeUpload(for info: UploadVideoInfo) throws
```

Resume the video that is paused
- Parameter info: specific video info

#### Parameters

| Name | Description |
| ---- | ----------- |
| info | specific video info |

### `removeUpload(for:)`

```swift
func removeUpload(for info: UploadVideoInfo) throws
```

Remove the uploading the video
- Parameter info: specific video info

#### Parameters

| Name | Description |
| ---- | ----------- |
| info | specific video info |