**STRUCT**

# `VideoInfo`

```swift
public struct VideoInfo: Hashable
```

A structure that contains metadata and content information for a video to be uploaded.

`VideoInfo` encapsulates all the necessary information needed to upload a video to the server,
including its content, metadata, and organizational information such as library and collection IDs.

## Properties
### `content`

```swift
public let content: VideoContent
```

The actual video content to be uploaded.

### `title`

```swift
public let title: String
```

The title of the video.

### `fileType`

```swift
public let fileType: String
```

The file type/extension of the video (e.g., "mp4", "mov").

### `videoId`

```swift
public let videoId: String
```

A unique identifier for the video.

### `collectionId`

```swift
public let collectionId: String?
```

An optional identifier for the collection this video belongs to.

### `libraryId`

```swift
public let libraryId: Int
```

The identifier of the library where this video will be stored.

### `expirationTime`

```swift
public let expirationTime: TimeInterval
```

The timestamp when the upload URL will expire, in seconds since 1970.

### `expirationTimeString`

```swift
public var expirationTimeString: String
```

A string representation of the expiration time formatted as a whole number.

This property is typically used when constructing API requests that require
the expiration time as a string value.

## Methods
### `init(content:title:fileType:videoId:collectionId:libraryId:expirationTime:)`

```swift
public init(content: VideoContent,
            title: String,
            fileType: String,
            videoId: String,
            collectionId: String? = nil,
            libraryId: Int,
            expirationTime: TimeInterval = Date().addingTimeInterval(3600).timeIntervalSince1970)
```

Creates a new video info instance with the specified parameters.

- Parameters:
  - content: The video content to be uploaded.
  - title: The title of the video.
  - fileType: The file type/extension of the video.
  - videoId: A unique identifier for the video.
  - collectionId: An optional identifier for the collection this video belongs to.
  - libraryId: The identifier of the library where this video will be stored.
  - expirationTime: The timestamp when the upload URL will expire. Defaults to 1 hour from creation.

#### Parameters

| Name | Description |
| ---- | ----------- |
| content | The video content to be uploaded. |
| title | The title of the video. |
| fileType | The file type/extension of the video. |
| videoId | A unique identifier for the video. |
| collectionId | An optional identifier for the collection this video belongs to. |
| libraryId | The identifier of the library where this video will be stored. |
| expirationTime | The timestamp when the upload URL will expire. Defaults to 1 hour from creation. |