**STRUCT**

# `Schemas.ResolutionReference`

```swift
public struct ResolutionReference: Codable, Hashable, Sendable
```

- Remark: Generated from `#/components/schemas/ResolutionReference`.

## Properties
### `resolution`

```swift
public var resolution: Swift.String?
```

- Remark: Generated from `#/components/schemas/ResolutionReference/resolution`.

### `path`

```swift
public var path: Swift.String?
```

- Remark: Generated from `#/components/schemas/ResolutionReference/path`.

### `additionalProperties`

```swift
public var additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer
```

A container of undocumented properties.

## Methods
### `init(resolution:path:additionalProperties:)`

```swift
public init(
    resolution: Swift.String? = nil,
    path: Swift.String? = nil,
    additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer = .init()
)
```

Creates a new `ResolutionReference`.

- Parameters:
  - resolution:
  - path:
  - additionalProperties: A container of undocumented properties.

#### Parameters

| Name | Description |
| ---- | ----------- |
| resolution |  |
| path |  |
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