**STRUCT**

# `Schemas.VideoModel`

```swift
public struct VideoModel: Codable, Hashable, Sendable
```

- Remark: Generated from `#/components/schemas/VideoModel`.

## Properties
### `videoLibraryId`

```swift
public var videoLibraryId: Swift.Int64?
```

The ID of the video library that the video belongs to

- Remark: Generated from `#/components/schemas/VideoModel/videoLibraryId`.

### `guid`

```swift
public var guid: Swift.String?
```

The unique ID of the video

- Remark: Generated from `#/components/schemas/VideoModel/guid`.

### `title`

```swift
public var title: Swift.String?
```

The title of the video

- Remark: Generated from `#/components/schemas/VideoModel/title`.

### `dateUploaded`

```swift
public var dateUploaded: Foundation.Date?
```

The date when the video was uploaded

- Remark: Generated from `#/components/schemas/VideoModel/dateUploaded`.

### `views`

```swift
public var views: Swift.Int64?
```

The number of views the video received

- Remark: Generated from `#/components/schemas/VideoModel/views`.

### `isPublic`

```swift
public var isPublic: Swift.Bool?
```

Determines if the video is publically accessible

- Remark: Generated from `#/components/schemas/VideoModel/isPublic`.

### `length`

```swift
public var length: Swift.Int32?
```

The duration of the video in seconds

- Remark: Generated from `#/components/schemas/VideoModel/length`.

### `status`

```swift
public var status: Components.Schemas.VideoModel.statusPayload?
```

The status of the video. See VideoModelStatus.

- Remark: Generated from `#/components/schemas/VideoModel/status`.

### `framerate`

```swift
public var framerate: Swift.Double?
```

The framerate of the video

- Remark: Generated from `#/components/schemas/VideoModel/framerate`.

### `rotation`

```swift
public var rotation: Swift.Int?
```

The rotation of the video

- Remark: Generated from `#/components/schemas/VideoModel/rotation`.

### `width`

```swift
public var width: Swift.Int32?
```

The width of the original video file

- Remark: Generated from `#/components/schemas/VideoModel/width`.

### `height`

```swift
public var height: Swift.Int32?
```

The height of the original video file

- Remark: Generated from `#/components/schemas/VideoModel/height`.

### `availableResolutions`

```swift
public var availableResolutions: Swift.String?
```

The available resolutions of the video

- Remark: Generated from `#/components/schemas/VideoModel/availableResolutions`.

### `outputCodecs`

```swift
public var outputCodecs: Swift.String?
```

Encoded output codecs of the video

- Remark: Generated from `#/components/schemas/VideoModel/outputCodecs`.

### `thumbnailCount`

```swift
public var thumbnailCount: Swift.Int32?
```

The number of thumbnails generated for this video

- Remark: Generated from `#/components/schemas/VideoModel/thumbnailCount`.

### `encodeProgress`

```swift
public var encodeProgress: Swift.Int32?
```

The current encode progress of the video

- Remark: Generated from `#/components/schemas/VideoModel/encodeProgress`.

### `storageSize`

```swift
public var storageSize: Swift.Int64?
```

The amount of storage used by this video

- Remark: Generated from `#/components/schemas/VideoModel/storageSize`.

### `captions`

```swift
public var captions: [Components.Schemas.CaptionModel]?
```

The list of captions available for the video

- Remark: Generated from `#/components/schemas/VideoModel/captions`.

### `hasMP4Fallback`

```swift
public var hasMP4Fallback: Swift.Bool?
```

Determines if the video has MP4 fallback files generated

- Remark: Generated from `#/components/schemas/VideoModel/hasMP4Fallback`.

### `collectionId`

```swift
public var collectionId: Swift.String?
```

The ID of the collection where the video belongs

- Remark: Generated from `#/components/schemas/VideoModel/collectionId`.

### `thumbnailFileName`

```swift
public var thumbnailFileName: Swift.String?
```

The file name of the thumbnail inside of the storage

- Remark: Generated from `#/components/schemas/VideoModel/thumbnailFileName`.

### `averageWatchTime`

```swift
public var averageWatchTime: Swift.Int64?
```

The average watch time of the video in seconds

- Remark: Generated from `#/components/schemas/VideoModel/averageWatchTime`.

### `totalWatchTime`

```swift
public var totalWatchTime: Swift.Int64?
```

The total video watch time in seconds

- Remark: Generated from `#/components/schemas/VideoModel/totalWatchTime`.

### `category`

```swift
public var category: Swift.String?
```

The automatically detected category of the video

- Remark: Generated from `#/components/schemas/VideoModel/category`.

### `chapters`

```swift
public var chapters: [Components.Schemas.ChapterModel]?
```

The list of chapters available for the video

- Remark: Generated from `#/components/schemas/VideoModel/chapters`.

### `moments`

```swift
public var moments: [Components.Schemas.MomentModel]?
```

The list of moments available for the video

- Remark: Generated from `#/components/schemas/VideoModel/moments`.

### `metaTags`

```swift
public var metaTags: [Components.Schemas.MetaTagModel]?
```

The list of meta tags that have been added to the video

- Remark: Generated from `#/components/schemas/VideoModel/metaTags`.

### `transcodingMessages`

```swift
public var transcodingMessages: [Components.Schemas.TranscodingMessageModel]?
```

The list of transcoding messages that describe potential issues while the video was transcoding

- Remark: Generated from `#/components/schemas/VideoModel/transcodingMessages`.

### `additionalProperties`

```swift
public var additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer
```

A container of undocumented properties.

## Methods
### `init(videoLibraryId:guid:title:dateUploaded:views:isPublic:length:status:framerate:rotation:width:height:availableResolutions:outputCodecs:thumbnailCount:encodeProgress:storageSize:captions:hasMP4Fallback:collectionId:thumbnailFileName:averageWatchTime:totalWatchTime:category:chapters:moments:metaTags:transcodingMessages:additionalProperties:)`

```swift
public init(
    videoLibraryId: Swift.Int64? = nil,
    guid: Swift.String? = nil,
    title: Swift.String? = nil,
    dateUploaded: Foundation.Date? = nil,
    views: Swift.Int64? = nil,
    isPublic: Swift.Bool? = nil,
    length: Swift.Int32? = nil,
    status: Components.Schemas.VideoModel.statusPayload? = nil,
    framerate: Swift.Double? = nil,
    rotation: Swift.Int? = nil,
    width: Swift.Int32? = nil,
    height: Swift.Int32? = nil,
    availableResolutions: Swift.String? = nil,
    outputCodecs: Swift.String? = nil,
    thumbnailCount: Swift.Int32? = nil,
    encodeProgress: Swift.Int32? = nil,
    storageSize: Swift.Int64? = nil,
    captions: [Components.Schemas.CaptionModel]? = nil,
    hasMP4Fallback: Swift.Bool? = nil,
    collectionId: Swift.String? = nil,
    thumbnailFileName: Swift.String? = nil,
    averageWatchTime: Swift.Int64? = nil,
    totalWatchTime: Swift.Int64? = nil,
    category: Swift.String? = nil,
    chapters: [Components.Schemas.ChapterModel]? = nil,
    moments: [Components.Schemas.MomentModel]? = nil,
    metaTags: [Components.Schemas.MetaTagModel]? = nil,
    transcodingMessages: [Components.Schemas.TranscodingMessageModel]? = nil,
    additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer = .init()
)
```

Creates a new `VideoModel`.

- Parameters:
  - videoLibraryId: The ID of the video library that the video belongs to
  - guid: The unique ID of the video
  - title: The title of the video
  - dateUploaded: The date when the video was uploaded
  - views: The number of views the video received
  - isPublic: Determines if the video is publically accessible
  - length: The duration of the video in seconds
  - status: The status of the video. See VideoModelStatus.
  - framerate: The framerate of the video
  - rotation: The rotation of the video
  - width: The width of the original video file
  - height: The height of the original video file
  - availableResolutions: The available resolutions of the video
  - outputCodecs: Encoded output codecs of the video
  - thumbnailCount: The number of thumbnails generated for this video
  - encodeProgress: The current encode progress of the video
  - storageSize: The amount of storage used by this video
  - captions: The list of captions available for the video
  - hasMP4Fallback: Determines if the video has MP4 fallback files generated
  - collectionId: The ID of the collection where the video belongs
  - thumbnailFileName: The file name of the thumbnail inside of the storage
  - averageWatchTime: The average watch time of the video in seconds
  - totalWatchTime: The total video watch time in seconds
  - category: The automatically detected category of the video
  - chapters: The list of chapters available for the video
  - moments: The list of moments available for the video
  - metaTags: The list of meta tags that have been added to the video
  - transcodingMessages: The list of transcoding messages that describe potential issues while the video was transcoding
  - additionalProperties: A container of undocumented properties.

#### Parameters

| Name | Description |
| ---- | ----------- |
| videoLibraryId | The ID of the video library that the video belongs to |
| guid | The unique ID of the video |
| title | The title of the video |
| dateUploaded | The date when the video was uploaded |
| views | The number of views the video received |
| isPublic | Determines if the video is publically accessible |
| length | The duration of the video in seconds |
| status | The status of the video. See VideoModelStatus. |
| framerate | The framerate of the video |
| rotation | The rotation of the video |
| width | The width of the original video file |
| height | The height of the original video file |
| availableResolutions | The available resolutions of the video |
| outputCodecs | Encoded output codecs of the video |
| thumbnailCount | The number of thumbnails generated for this video |
| encodeProgress | The current encode progress of the video |
| storageSize | The amount of storage used by this video |
| captions | The list of captions available for the video |
| hasMP4Fallback | Determines if the video has MP4 fallback files generated |
| collectionId | The ID of the collection where the video belongs |
| thumbnailFileName | The file name of the thumbnail inside of the storage |
| averageWatchTime | The average watch time of the video in seconds |
| totalWatchTime | The total video watch time in seconds |
| category | The automatically detected category of the video |
| chapters | The list of chapters available for the video |
| moments | The list of moments available for the video |
| metaTags | The list of meta tags that have been added to the video |
| transcodingMessages | The list of transcoding messages that describe potential issues while the video was transcoding |
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