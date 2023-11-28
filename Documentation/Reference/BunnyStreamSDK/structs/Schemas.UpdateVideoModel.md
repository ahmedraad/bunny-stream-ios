**STRUCT**

# `Schemas.UpdateVideoModel`

```swift
public struct UpdateVideoModel: Codable, Hashable, Sendable
```

- Remark: Generated from `#/components/schemas/UpdateVideoModel`.

## Properties
### `title`

```swift
public var title: Swift.String?
```

The title of the video

- Remark: Generated from `#/components/schemas/UpdateVideoModel/title`.

### `collectionId`

```swift
public var collectionId: Swift.String?
```

The ID of the collection where the video belongs

- Remark: Generated from `#/components/schemas/UpdateVideoModel/collectionId`.

### `chapters`

```swift
public var chapters: [Components.Schemas.ChapterModel]?
```

The list of chapters available for the video

- Remark: Generated from `#/components/schemas/UpdateVideoModel/chapters`.

### `moments`

```swift
public var moments: [Components.Schemas.MomentModel]?
```

The list of moments available for the video

- Remark: Generated from `#/components/schemas/UpdateVideoModel/moments`.

### `metaTags`

```swift
public var metaTags: [Components.Schemas.MetaTagModel]?
```

The meta tags added to the video

- Remark: Generated from `#/components/schemas/UpdateVideoModel/metaTags`.

## Methods
### `init(title:collectionId:chapters:moments:metaTags:)`

```swift
public init(
    title: Swift.String? = nil,
    collectionId: Swift.String? = nil,
    chapters: [Components.Schemas.ChapterModel]? = nil,
    moments: [Components.Schemas.MomentModel]? = nil,
    metaTags: [Components.Schemas.MetaTagModel]? = nil
)
```

Creates a new `UpdateVideoModel`.

- Parameters:
  - title: The title of the video
  - collectionId: The ID of the collection where the video belongs
  - chapters: The list of chapters available for the video
  - moments: The list of moments available for the video
  - metaTags: The meta tags added to the video

#### Parameters

| Name | Description |
| ---- | ----------- |
| title | The title of the video |
| collectionId | The ID of the collection where the video belongs |
| chapters | The list of chapters available for the video |
| moments | The list of moments available for the video |
| metaTags | The meta tags added to the video |