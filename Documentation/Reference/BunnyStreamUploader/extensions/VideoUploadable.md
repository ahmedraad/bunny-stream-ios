**EXTENSION**

# `VideoUploadable`
```swift
public extension VideoUploadable
```

## Methods
### `uploadVideo(with:)`

```swift
func uploadVideo(with info: VideoInfo) async throws
```

Uploads a single video file to the server.

This convenience method wraps the multi-video upload functionality to provide
a simpler interface for single video uploads. It internally calls `uploadVideos(with:)`
with a single-element array.

- Parameter info: A `VideoInfo` object containing the metadata and file information
                 for the video to be uploaded.
- Throws: An error if the upload process fails for any reason.

#### Parameters

| Name | Description |
| ---- | ----------- |
| info | A `VideoInfo` object containing the metadata and file information for the video to be uploaded. |