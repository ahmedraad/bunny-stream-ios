**STRUCT**

# `Schemas.MomentModel`

```swift
public struct MomentModel: Codable, Hashable, Sendable
```

- Remark: Generated from `#/components/schemas/MomentModel`.

## Properties
### `label`

```swift
public var label: Swift.String
```

The text description label for the chapter

- Remark: Generated from `#/components/schemas/MomentModel/label`.

### `timestamp`

```swift
public var timestamp: Swift.Int32?
```

The timestamp of the moment in seconds

- Remark: Generated from `#/components/schemas/MomentModel/timestamp`.

### `additionalProperties`

```swift
public var additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer
```

A container of undocumented properties.

## Methods
### `init(label:timestamp:additionalProperties:)`

```swift
public init(
    label: Swift.String,
    timestamp: Swift.Int32? = nil,
    additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer = .init()
)
```

Creates a new `MomentModel`.

- Parameters:
  - label: The text description label for the chapter
  - timestamp: The timestamp of the moment in seconds
  - additionalProperties: A container of undocumented properties.

#### Parameters

| Name | Description |
| ---- | ----------- |
| label | The text description label for the chapter |
| timestamp | The timestamp of the moment in seconds |
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