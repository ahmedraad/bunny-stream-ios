**STRUCT**

# `VideoModel.statusPayload`

```swift
public struct statusPayload: Codable, Hashable, Sendable
```

The status of the video. Created = 0, Uploaded = 1, Processing = 2, Transcoding = 3, Finished = 4, Error = 5, UploadFailed = 6

- Remark: Generated from `#/components/schemas/VideoModel/status`.

## Properties
### `value1`

```swift
public var value1: Components.Schemas.VideoModelStatus
```

- Remark: Generated from `#/components/schemas/VideoModel/status/value1`.

## Methods
### `init(value1:)`

```swift
public init(value1: Components.Schemas.VideoModelStatus)
```

Creates a new `statusPayload`.

- Parameters:
  - value1:

#### Parameters

| Name | Description |
| ---- | ----------- |
| value1 |  |

### `init(from:)`

```swift
public init(from decoder: any Decoder) throws
```

#### Parameters

| Name | Description |
| ---- | ----------- |
| decoder | The decoder to read data from. |

### `encode(to:)`

```swift
public func encode(to encoder: any Encoder) throws
```

#### Parameters

| Name | Description |
| ---- | ----------- |
| encoder | The encoder to write data to. |