**STRUCT**

# `Schemas.StatusModel`

```swift
public struct StatusModel: Codable, Hashable, Sendable
```

- Remark: Generated from `#/components/schemas/StatusModel`.

## Properties
### `success`

```swift
public var success: Swift.Bool?
```

Determines if the request was successful

- Remark: Generated from `#/components/schemas/StatusModel/success`.

### `message`

```swift
public var message: Swift.String?
```

Response message description

- Remark: Generated from `#/components/schemas/StatusModel/message`.

### `statusCode`

```swift
public var statusCode: Swift.Int32?
```

The response status code

- Remark: Generated from `#/components/schemas/StatusModel/statusCode`.

### `additionalProperties`

```swift
public var additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer
```

A container of undocumented properties.

## Methods
### `init(success:message:statusCode:additionalProperties:)`

```swift
public init(
    success: Swift.Bool? = nil,
    message: Swift.String? = nil,
    statusCode: Swift.Int32? = nil,
    additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer = .init()
)
```

Creates a new `StatusModel`.

- Parameters:
  - success: Determines if the request was successful
  - message: Response message description
  - statusCode: The response status code
  - additionalProperties: A container of undocumented properties.

#### Parameters

| Name | Description |
| ---- | ----------- |
| success | Determines if the request was successful |
| message | Response message description |
| statusCode | The response status code |
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