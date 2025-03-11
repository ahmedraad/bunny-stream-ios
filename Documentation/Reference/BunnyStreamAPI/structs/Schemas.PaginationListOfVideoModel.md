**STRUCT**

# `Schemas.PaginationListOfVideoModel`

```swift
public struct PaginationListOfVideoModel: Codable, Hashable, Sendable
```

- Remark: Generated from `#/components/schemas/PaginationListOfVideoModel`.

## Properties
### `totalItems`

```swift
public var totalItems: Swift.Int64?
```

The total number of items that can be returned

- Remark: Generated from `#/components/schemas/PaginationListOfVideoModel/totalItems`.

### `currentPage`

```swift
public var currentPage: Swift.Int64?
```

The current page of the response

- Remark: Generated from `#/components/schemas/PaginationListOfVideoModel/currentPage`.

### `itemsPerPage`

```swift
public var itemsPerPage: Swift.Int32?
```

The number of items returned per page

- Remark: Generated from `#/components/schemas/PaginationListOfVideoModel/itemsPerPage`.

### `items`

```swift
public var items: [Components.Schemas.VideoModel]?
```

The result items on the current result

- Remark: Generated from `#/components/schemas/PaginationListOfVideoModel/items`.

### `additionalProperties`

```swift
public var additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer
```

A container of undocumented properties.

## Methods
### `init(totalItems:currentPage:itemsPerPage:items:additionalProperties:)`

```swift
public init(
    totalItems: Swift.Int64? = nil,
    currentPage: Swift.Int64? = nil,
    itemsPerPage: Swift.Int32? = nil,
    items: [Components.Schemas.VideoModel]? = nil,
    additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer = .init()
)
```

Creates a new `PaginationListOfVideoModel`.

- Parameters:
  - totalItems: The total number of items that can be returned
  - currentPage: The current page of the response
  - itemsPerPage: The number of items returned per page
  - items: The result items on the current result
  - additionalProperties: A container of undocumented properties.

#### Parameters

| Name | Description |
| ---- | ----------- |
| totalItems | The total number of items that can be returned |
| currentPage | The current page of the response |
| itemsPerPage | The number of items returned per page |
| items | The result items on the current result |
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