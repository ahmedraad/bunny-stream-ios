**STRUCT**

# `Schemas.TranscodingMessageModel`

```swift
public struct TranscodingMessageModel: Codable, Hashable, Sendable
```

- Remark: Generated from `#/components/schemas/TranscodingMessageModel`.

## Properties
### `timeStamp`

```swift
public var timeStamp: Foundation.Date?
```

- Remark: Generated from `#/components/schemas/TranscodingMessageModel/timeStamp`.

### `level`

```swift
public var level: Components.Schemas.Severity?
```

- Remark: Generated from `#/components/schemas/TranscodingMessageModel/level`.

### `issueCode`

```swift
public var issueCode: Components.Schemas.IssueCodes?
```

- Remark: Generated from `#/components/schemas/TranscodingMessageModel/issueCode`.

### `message`

```swift
public var message: Swift.String?
```

- Remark: Generated from `#/components/schemas/TranscodingMessageModel/message`.

### `value`

```swift
public var value: Swift.String?
```

- Remark: Generated from `#/components/schemas/TranscodingMessageModel/value`.

### `additionalProperties`

```swift
public var additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer
```

A container of undocumented properties.

## Methods
### `init(timeStamp:level:issueCode:message:value:additionalProperties:)`

```swift
public init(
    timeStamp: Foundation.Date? = nil,
    level: Components.Schemas.Severity? = nil,
    issueCode: Components.Schemas.IssueCodes? = nil,
    message: Swift.String? = nil,
    value: Swift.String? = nil,
    additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer = .init()
)
```

Creates a new `TranscodingMessageModel`.

- Parameters:
  - timeStamp:
  - level:
  - issueCode:
  - message:
  - value:
  - additionalProperties: A container of undocumented properties.

#### Parameters

| Name | Description |
| ---- | ----------- |
| timeStamp |  |
| level |  |
| issueCode |  |
| message |  |
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