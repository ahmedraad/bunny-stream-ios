**STRUCT**

# `Schemas.UpdateCollectionModel`

```swift
public struct UpdateCollectionModel: Codable, Hashable, Sendable
```

- Remark: Generated from `#/components/schemas/UpdateCollectionModel`.

## Properties
### `name`

```swift
public var name: Swift.String?
```

The name of the collection

- Remark: Generated from `#/components/schemas/UpdateCollectionModel/name`.

### `additionalProperties`

```swift
public var additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer
```

A container of undocumented properties.

## Methods
### `init(name:additionalProperties:)`

```swift
public init(
    name: Swift.String? = nil,
    additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer = .init()
)
```

Creates a new `UpdateCollectionModel`.

- Parameters:
  - name: The name of the collection
  - additionalProperties: A container of undocumented properties.

#### Parameters

| Name | Description |
| ---- | ----------- |
| name | The name of the collection |
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