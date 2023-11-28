**STRUCT**

# `Schemas.CollectionModel`

```swift
public struct CollectionModel: Codable, Hashable, Sendable
```

- Remark: Generated from `#/components/schemas/CollectionModel`.

## Properties
### `videoLibraryId`

```swift
public var videoLibraryId: Swift.Int64
```

The video library ID that contains the collection

- Remark: Generated from `#/components/schemas/CollectionModel/videoLibraryId`.

### `guid`

```swift
public var guid: Swift.String?
```

The unique ID of the collection

- Remark: Generated from `#/components/schemas/CollectionModel/guid`.

### `name`

```swift
public var name: Swift.String?
```

The name of the collection

- Remark: Generated from `#/components/schemas/CollectionModel/name`.

### `videoCount`

```swift
public var videoCount: Swift.Int64
```

The number of videos that the collection contains

- Remark: Generated from `#/components/schemas/CollectionModel/videoCount`.

### `totalSize`

```swift
public var totalSize: Swift.Int64
```

The total storage size of the collection

- Remark: Generated from `#/components/schemas/CollectionModel/totalSize`.

### `previewVideoIds`

```swift
public var previewVideoIds: Swift.String?
```

The IDs of videos to be used as preview icons

- Remark: Generated from `#/components/schemas/CollectionModel/previewVideoIds`.

## Methods
### `init(videoLibraryId:guid:name:videoCount:totalSize:previewVideoIds:)`

```swift
public init(
    videoLibraryId: Swift.Int64,
    guid: Swift.String? = nil,
    name: Swift.String? = nil,
    videoCount: Swift.Int64,
    totalSize: Swift.Int64,
    previewVideoIds: Swift.String? = nil
)
```

Creates a new `CollectionModel`.

- Parameters:
  - videoLibraryId: The video library ID that contains the collection
  - guid: The unique ID of the collection
  - name: The name of the collection
  - videoCount: The number of videos that the collection contains
  - totalSize: The total storage size of the collection
  - previewVideoIds: The IDs of videos to be used as preview icons

#### Parameters

| Name | Description |
| ---- | ----------- |
| videoLibraryId | The video library ID that contains the collection |
| guid | The unique ID of the collection |
| name | The name of the collection |
| videoCount | The number of videos that the collection contains |
| totalSize | The total storage size of the collection |
| previewVideoIds | The IDs of videos to be used as preview icons |