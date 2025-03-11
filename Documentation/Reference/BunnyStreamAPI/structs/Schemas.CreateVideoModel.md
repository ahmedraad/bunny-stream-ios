**STRUCT**

# `Schemas.CreateVideoModel`

```swift
public struct CreateVideoModel: Codable, Hashable, Sendable
```

- Remark: Generated from `#/components/schemas/CreateVideoModel`.

## Properties
### `title`

```swift
public var title: Swift.String
```

The title of the video

- Remark: Generated from `#/components/schemas/CreateVideoModel/title`.

### `collectionId`

```swift
public var collectionId: Swift.String?
```

The ID of the collection where the video will be put

- Remark: Generated from `#/components/schemas/CreateVideoModel/collectionId`.

### `thumbnailTime`

```swift
public var thumbnailTime: Swift.Int32?
```

Video time in ms to extract the main video thumbnail.

- Remark: Generated from `#/components/schemas/CreateVideoModel/thumbnailTime`.

### `additionalProperties`

```swift
public var additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer
```

A container of undocumented properties.

## Methods
### `init(title:collectionId:thumbnailTime:additionalProperties:)`

```swift
public init(
    title: Swift.String,
    collectionId: Swift.String? = nil,
    thumbnailTime: Swift.Int32? = nil,
    additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer = .init()
)
```

Creates a new `CreateVideoModel`.

- Parameters:
  - title: The title of the video
  - collectionId: The ID of the collection where the video will be put
  - thumbnailTime: Video time in ms to extract the main video thumbnail.
  - additionalProperties: A container of undocumented properties.

#### Parameters

| Name | Description |
| ---- | ----------- |
| title | The title of the video |
| collectionId | The ID of the collection where the video will be put |
| thumbnailTime | Video time in ms to extract the main video thumbnail. |
| additionalProperties | A container of undocumented properties. |

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