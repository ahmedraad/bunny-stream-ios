**STRUCT**

# `Schemas.VideoResolutionsInfoModel`

```swift
public struct VideoResolutionsInfoModel: Codable, Hashable, Sendable
```

- Remark: Generated from `#/components/schemas/VideoResolutionsInfoModel`.

## Properties
### `videoId`

```swift
public var videoId: Swift.String?
```

- Remark: Generated from `#/components/schemas/VideoResolutionsInfoModel/videoId`.

### `videoLibraryId`

```swift
public var videoLibraryId: Swift.Int64?
```

- Remark: Generated from `#/components/schemas/VideoResolutionsInfoModel/videoLibraryId`.

### `availableResolutions`

```swift
public var availableResolutions: [Swift.String]?
```

- Remark: Generated from `#/components/schemas/VideoResolutionsInfoModel/availableResolutions`.

### `configuredResolutions`

```swift
public var configuredResolutions: [Swift.String]?
```

- Remark: Generated from `#/components/schemas/VideoResolutionsInfoModel/configuredResolutions`.

### `playlistResolutions`

```swift
public var playlistResolutions: [Components.Schemas.ResolutionReference]?
```

- Remark: Generated from `#/components/schemas/VideoResolutionsInfoModel/playlistResolutions`.

### `storageResolutions`

```swift
public var storageResolutions: [Components.Schemas.ResolutionReference]?
```

- Remark: Generated from `#/components/schemas/VideoResolutionsInfoModel/storageResolutions`.

### `mp4Resolutions`

```swift
public var mp4Resolutions: [Components.Schemas.ResolutionReference]?
```

- Remark: Generated from `#/components/schemas/VideoResolutionsInfoModel/mp4Resolutions`.

### `storageObjects`

```swift
public var storageObjects: [Components.Schemas.StorageObjectModel]?
```

- Remark: Generated from `#/components/schemas/VideoResolutionsInfoModel/storageObjects`.

### `oldResolutions`

```swift
public var oldResolutions: [Components.Schemas.StorageObjectModel]?
```

- Remark: Generated from `#/components/schemas/VideoResolutionsInfoModel/oldResolutions`.

### `hasBothOldAndNewResolutionFormat`

```swift
public var hasBothOldAndNewResolutionFormat: Swift.Bool?
```

- Remark: Generated from `#/components/schemas/VideoResolutionsInfoModel/hasBothOldAndNewResolutionFormat`.

### `hasOriginal`

```swift
public var hasOriginal: Swift.Bool?
```

- Remark: Generated from `#/components/schemas/VideoResolutionsInfoModel/hasOriginal`.

### `additionalProperties`

```swift
public var additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer
```

A container of undocumented properties.

## Methods
### `init(videoId:videoLibraryId:availableResolutions:configuredResolutions:playlistResolutions:storageResolutions:mp4Resolutions:storageObjects:oldResolutions:hasBothOldAndNewResolutionFormat:hasOriginal:additionalProperties:)`

```swift
public init(
    videoId: Swift.String? = nil,
    videoLibraryId: Swift.Int64? = nil,
    availableResolutions: [Swift.String]? = nil,
    configuredResolutions: [Swift.String]? = nil,
    playlistResolutions: [Components.Schemas.ResolutionReference]? = nil,
    storageResolutions: [Components.Schemas.ResolutionReference]? = nil,
    mp4Resolutions: [Components.Schemas.ResolutionReference]? = nil,
    storageObjects: [Components.Schemas.StorageObjectModel]? = nil,
    oldResolutions: [Components.Schemas.StorageObjectModel]? = nil,
    hasBothOldAndNewResolutionFormat: Swift.Bool? = nil,
    hasOriginal: Swift.Bool? = nil,
    additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer = .init()
)
```

Creates a new `VideoResolutionsInfoModel`.

- Parameters:
  - videoId:
  - videoLibraryId:
  - availableResolutions:
  - configuredResolutions:
  - playlistResolutions:
  - storageResolutions:
  - mp4Resolutions:
  - storageObjects:
  - oldResolutions:
  - hasBothOldAndNewResolutionFormat:
  - hasOriginal:
  - additionalProperties: A container of undocumented properties.

#### Parameters

| Name | Description |
| ---- | ----------- |
| videoId |  |
| videoLibraryId |  |
| availableResolutions |  |
| configuredResolutions |  |
| playlistResolutions |  |
| storageResolutions |  |
| mp4Resolutions |  |
| storageObjects |  |
| oldResolutions |  |
| hasBothOldAndNewResolutionFormat |  |
| hasOriginal |  |
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