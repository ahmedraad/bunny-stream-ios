**STRUCT**

# `Schemas.PaginationListOfVideoModel`

```swift
public struct PaginationListOfVideoModel: Codable, Hashable, Sendable
```

- Remark: Generated from `#/components/schemas/PaginationListOfVideoModel`.

## Properties
### `totalItems`

```swift
public var totalItems: Swift.Int64
```

The total number of items that can be returned

- Remark: Generated from `#/components/schemas/PaginationListOfVideoModel/totalItems`.

### `currentPage`

```swift
public var currentPage: Swift.Int64
```

The current page of the response

- Remark: Generated from `#/components/schemas/PaginationListOfVideoModel/currentPage`.

### `itemsPerPage`

```swift
public var itemsPerPage: Swift.Int32
```

The number of items returned per page

- Remark: Generated from `#/components/schemas/PaginationListOfVideoModel/itemsPerPage`.

### `items`

```swift
public var items: [Components.Schemas.VideoModel]?
```

The result items on the current result

- Remark: Generated from `#/components/schemas/PaginationListOfVideoModel/items`.

## Methods
### `init(totalItems:currentPage:itemsPerPage:items:)`

```swift
public init(
    totalItems: Swift.Int64,
    currentPage: Swift.Int64,
    itemsPerPage: Swift.Int32,
    items: [Components.Schemas.VideoModel]? = nil
)
```

Creates a new `PaginationListOfVideoModel`.

- Parameters:
  - totalItems: The total number of items that can be returned
  - currentPage: The current page of the response
  - itemsPerPage: The number of items returned per page
  - items: The result items on the current result

#### Parameters

| Name | Description |
| ---- | ----------- |
| totalItems | The total number of items that can be returned |
| currentPage | The current page of the response |
| itemsPerPage | The number of items returned per page |
| items | The result items on the current result |