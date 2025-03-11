**STRUCT**

# `Schemas.MetaTagModel`

```swift
public struct MetaTagModel: Codable, Hashable, Sendable
```

- Remark: Generated from `#/components/schemas/MetaTagModel`.

## Properties
### `property`

```swift
public var property: Swift.String?
```

- Remark: Generated from `#/components/schemas/MetaTagModel/property`.

### `value`

```swift
public var value: Swift.String?
```

- Remark: Generated from `#/components/schemas/MetaTagModel/value`.

### `additionalProperties`

```swift
public var additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer
```

A container of undocumented properties.

## Methods
### `init(property:value:additionalProperties:)`

```swift
public init(
    property: Swift.String? = nil,
    value: Swift.String? = nil,
    additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer = .init()
)
```

Creates a new `MetaTagModel`.

- Parameters:
  - property:
  - value:
  - additionalProperties: A container of undocumented properties.

#### Parameters

| Name | Description |
| ---- | ----------- |
| property |  |
| value |  |
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