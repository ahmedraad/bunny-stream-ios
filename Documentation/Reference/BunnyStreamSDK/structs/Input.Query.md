**STRUCT**

# `Input.Query`

```swift
public struct Query: Sendable, Hashable
```

- Remark: Generated from `#/paths/library/{libraryId}/videos/fetch/POST/query`.

## Properties
### `collectionId`

```swift
public var collectionId: Swift.String?
```

- Remark: Generated from `#/paths/library/{libraryId}/videos/fetch/POST/query/collectionId`.

### `thumbnailTime`

```swift
public var thumbnailTime: Swift.Int32?
```

(Optional) Video time in ms to extract the main video thumbnail.

- Remark: Generated from `#/paths/library/{libraryId}/videos/fetch/POST/query/thumbnailTime`.

## Methods
### `init(collectionId:thumbnailTime:)`

```swift
public init(collectionId: Swift.String? = nil, thumbnailTime: Swift.Int32? = nil)
```

Creates a new `Query`.

- Parameters:
  - collectionId:
  - thumbnailTime: (Optional) Video time in ms to extract the main video thumbnail.

#### Parameters

| Name | Description |
| ---- | ----------- |
| collectionId |  |
| thumbnailTime | (Optional) Video time in ms to extract the main video thumbnail. |