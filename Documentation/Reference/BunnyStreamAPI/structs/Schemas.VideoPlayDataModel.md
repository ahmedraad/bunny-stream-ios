**STRUCT**

# `Schemas.VideoPlayDataModel`

```swift
public struct VideoPlayDataModel: Codable, Hashable, Sendable
```

- Remark: Generated from `#/components/schemas/VideoPlayDataModel`.

## Properties
### `video`

```swift
public var video: Components.Schemas.VideoPlayDataModel.videoPayload?
```

Video data.

- Remark: Generated from `#/components/schemas/VideoPlayDataModel/video`.

### `captionsPath`

```swift
public var captionsPath: Swift.String?
```

- Remark: Generated from `#/components/schemas/VideoPlayDataModel/captionsPath`.

### `seekPath`

```swift
public var seekPath: Swift.String?
```

- Remark: Generated from `#/components/schemas/VideoPlayDataModel/seekPath`.

### `thumbnailUrl`

```swift
public var thumbnailUrl: Swift.String?
```

- Remark: Generated from `#/components/schemas/VideoPlayDataModel/thumbnailUrl`.

### `fallbackUrl`

```swift
public var fallbackUrl: Swift.String?
```

- Remark: Generated from `#/components/schemas/VideoPlayDataModel/fallbackUrl`.

### `videoPlaylistUrl`

```swift
public var videoPlaylistUrl: Swift.String?
```

- Remark: Generated from `#/components/schemas/VideoPlayDataModel/videoPlaylistUrl`.

### `originalUrl`

```swift
public var originalUrl: Swift.String?
```

- Remark: Generated from `#/components/schemas/VideoPlayDataModel/originalUrl`.

### `previewUrl`

```swift
public var previewUrl: Swift.String?
```

- Remark: Generated from `#/components/schemas/VideoPlayDataModel/previewUrl`.

### `controls`

```swift
public var controls: Swift.String?
```

- Remark: Generated from `#/components/schemas/VideoPlayDataModel/controls`.

### `enableDRM`

```swift
public var enableDRM: Swift.Bool?
```

- Remark: Generated from `#/components/schemas/VideoPlayDataModel/enableDRM`.

### `drmVersion`

```swift
public var drmVersion: Swift.Int32?
```

- Remark: Generated from `#/components/schemas/VideoPlayDataModel/drmVersion`.

### `playerKeyColor`

```swift
public var playerKeyColor: Swift.String?
```

- Remark: Generated from `#/components/schemas/VideoPlayDataModel/playerKeyColor`.

### `vastTagUrl`

```swift
public var vastTagUrl: Swift.String?
```

- Remark: Generated from `#/components/schemas/VideoPlayDataModel/vastTagUrl`.

### `captionsFontSize`

```swift
public var captionsFontSize: Swift.Int32?
```

- Remark: Generated from `#/components/schemas/VideoPlayDataModel/captionsFontSize`.

### `captionsFontColor`

```swift
public var captionsFontColor: Swift.String?
```

- Remark: Generated from `#/components/schemas/VideoPlayDataModel/captionsFontColor`.

### `captionsBackground`

```swift
public var captionsBackground: Swift.String?
```

- Remark: Generated from `#/components/schemas/VideoPlayDataModel/captionsBackground`.

### `uiLanguage`

```swift
public var uiLanguage: Swift.String?
```

- Remark: Generated from `#/components/schemas/VideoPlayDataModel/uiLanguage`.

### `allowEarlyPlay`

```swift
public var allowEarlyPlay: Swift.Bool?
```

- Remark: Generated from `#/components/schemas/VideoPlayDataModel/allowEarlyPlay`.

### `tokenAuthEnabled`

```swift
public var tokenAuthEnabled: Swift.Bool?
```

- Remark: Generated from `#/components/schemas/VideoPlayDataModel/tokenAuthEnabled`.

### `enableMP4Fallback`

```swift
public var enableMP4Fallback: Swift.Bool?
```

- Remark: Generated from `#/components/schemas/VideoPlayDataModel/enableMP4Fallback`.

### `showHeatmap`

```swift
public var showHeatmap: Swift.Bool?
```

- Remark: Generated from `#/components/schemas/VideoPlayDataModel/showHeatmap`.

### `fontFamily`

```swift
public var fontFamily: Swift.String?
```

- Remark: Generated from `#/components/schemas/VideoPlayDataModel/fontFamily`.

### `playbackSpeeds`

```swift
public var playbackSpeeds: Swift.String?
```

- Remark: Generated from `#/components/schemas/VideoPlayDataModel/playbackSpeeds`.

### `additionalProperties`

```swift
public var additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer
```

A container of undocumented properties.

## Methods
### `init(video:captionsPath:seekPath:thumbnailUrl:fallbackUrl:videoPlaylistUrl:originalUrl:previewUrl:controls:enableDRM:drmVersion:playerKeyColor:vastTagUrl:captionsFontSize:captionsFontColor:captionsBackground:uiLanguage:allowEarlyPlay:tokenAuthEnabled:enableMP4Fallback:showHeatmap:fontFamily:playbackSpeeds:additionalProperties:)`

```swift
public init(
    video: Components.Schemas.VideoPlayDataModel.videoPayload? = nil,
    captionsPath: Swift.String? = nil,
    seekPath: Swift.String? = nil,
    thumbnailUrl: Swift.String? = nil,
    fallbackUrl: Swift.String? = nil,
    videoPlaylistUrl: Swift.String? = nil,
    originalUrl: Swift.String? = nil,
    previewUrl: Swift.String? = nil,
    controls: Swift.String? = nil,
    enableDRM: Swift.Bool? = nil,
    drmVersion: Swift.Int32? = nil,
    playerKeyColor: Swift.String? = nil,
    vastTagUrl: Swift.String? = nil,
    captionsFontSize: Swift.Int32? = nil,
    captionsFontColor: Swift.String? = nil,
    captionsBackground: Swift.String? = nil,
    uiLanguage: Swift.String? = nil,
    allowEarlyPlay: Swift.Bool? = nil,
    tokenAuthEnabled: Swift.Bool? = nil,
    enableMP4Fallback: Swift.Bool? = nil,
    showHeatmap: Swift.Bool? = nil,
    fontFamily: Swift.String? = nil,
    playbackSpeeds: Swift.String? = nil,
    additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer = .init()
)
```

Creates a new `VideoPlayDataModel`.

- Parameters:
  - video: Video data.
  - captionsPath:
  - seekPath:
  - thumbnailUrl:
  - fallbackUrl:
  - videoPlaylistUrl:
  - originalUrl:
  - previewUrl:
  - controls:
  - enableDRM:
  - drmVersion:
  - playerKeyColor:
  - vastTagUrl:
  - captionsFontSize:
  - captionsFontColor:
  - captionsBackground:
  - uiLanguage:
  - allowEarlyPlay:
  - tokenAuthEnabled:
  - enableMP4Fallback:
  - showHeatmap:
  - fontFamily:
  - playbackSpeeds:
  - additionalProperties: A container of undocumented properties.

#### Parameters

| Name | Description |
| ---- | ----------- |
| video | Video data. |
| captionsPath |  |
| seekPath |  |
| thumbnailUrl |  |
| fallbackUrl |  |
| videoPlaylistUrl |  |
| originalUrl |  |
| previewUrl |  |
| controls |  |
| enableDRM |  |
| drmVersion |  |
| playerKeyColor |  |
| vastTagUrl |  |
| captionsFontSize |  |
| captionsFontColor |  |
| captionsBackground |  |
| uiLanguage |  |
| allowEarlyPlay |  |
| tokenAuthEnabled |  |
| enableMP4Fallback |  |
| showHeatmap |  |
| fontFamily |  |
| playbackSpeeds |  |
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