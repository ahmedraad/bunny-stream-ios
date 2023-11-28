**PROTOCOL**

# `VideoUploadable`

```swift
public protocol VideoUploadable
```

## Properties
### `uploadTracker`

```swift
var uploadTracker: UploadTracker
```

Upload tracker for video files

## Methods
### `uploadVideos(with:)`

```swift
func uploadVideos(with infos: [VideoInfo]) async throws
```

Upload video files to server
- Parameter infos: multiple video informations

#### Parameters

| Name | Description |
| ---- | ----------- |
| infos | multiple video informations |