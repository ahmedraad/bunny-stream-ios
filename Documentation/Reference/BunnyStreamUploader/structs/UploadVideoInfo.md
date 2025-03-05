**STRUCT**

# `UploadVideoInfo`

```swift
public struct UploadVideoInfo: Equatable, Hashable
```

A structure that uniquely identifies and describes a video upload operation.

`UploadVideoInfo` combines unique identifiers for both the upload operation and the video
itself, along with the video's metadata. This structure is used to track and manage
individual upload operations throughout the upload process.

## Properties
### `uuid`

```swift
public let uuid: UUID
```

A unique identifier for this upload operation.

This UUID distinguishes between different upload attempts of the same video.

### `videoUUID`

```swift
public let videoUUID: UUID
```

A unique identifier for the video being uploaded.

This UUID remains constant across different upload attempts of the same video.

### `info`

```swift
public let info: VideoInfo
```

The metadata and content information for the video being uploaded.

## Methods
### `==(_:_:)`

```swift
public static func == (lhs: UploadVideoInfo, rhs: UploadVideoInfo) -> Bool
```

Determines whether two `UploadVideoInfo` instances represent the same upload operation.

Two instances are considered equal if they have the same upload UUID and video UUID,
regardless of the video info they contain.

- Parameters:
  - lhs: The left-hand side `UploadVideoInfo` instance to compare.
  - rhs: The right-hand side `UploadVideoInfo` instance to compare.
- Returns: `true` if both instances represent the same upload operation, `false` otherwise.

#### Parameters

| Name | Description |
| ---- | ----------- |
| lhs | The left-hand side `UploadVideoInfo` instance to compare. |
| rhs | The right-hand side `UploadVideoInfo` instance to compare. |