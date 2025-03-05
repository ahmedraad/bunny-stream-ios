**PROTOCOL**

# `VideoUploadable`

```swift
public protocol VideoUploadable
```

A protocol that defines the core functionality for uploading videos to a server.

Conforming types must provide an upload tracking mechanism and the ability to upload
multiple videos simultaneously.

## Properties
### `uploadTracker`

```swift
var uploadTracker: UploadTracker
```

The upload tracker responsible for monitoring and managing video upload progress.

The upload tracker maintains the state of all ongoing uploads and provides
progress updates through its delegate pattern.

## Methods
### `uploadVideos(with:)`

```swift
func uploadVideos(with infos: [VideoInfo]) async throws
```

Uploads multiple video files to the server.

This method handles the concurrent upload of multiple video files. It will attempt to
upload all videos and may throw an error if any of the uploads fail.

- Parameter infos: An array of `VideoInfo` objects containing the metadata and file information
                  for each video to be uploaded.
- Throws: An error if the upload process fails for any reason.

#### Parameters

| Name | Description |
| ---- | ----------- |
| infos | An array of `VideoInfo` objects containing the metadata and file information for each video to be uploaded. |