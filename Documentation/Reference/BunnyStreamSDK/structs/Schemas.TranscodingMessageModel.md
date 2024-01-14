**STRUCT**

# `Schemas.TranscodingMessageModel`

```swift
public struct TranscodingMessageModel: Codable, Hashable, Sendable
```

- Remark: Generated from `#/components/schemas/TranscodingMessageModel`.

## Properties
### `timeStamp`

```swift
public var timeStamp: Foundation.Date
```

- Remark: Generated from `#/components/schemas/TranscodingMessageModel/timeStamp`.

### `level`

```swift
public var level: Components.Schemas.Severity
```

- Remark: Generated from `#/components/schemas/TranscodingMessageModel/level`.

### `issueCode`

```swift
public var issueCode: Components.Schemas.IssueCodes
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

## Methods
### `init(timeStamp:level:issueCode:message:value:)`

```swift
public init(
    timeStamp: Foundation.Date,
    level: Components.Schemas.Severity,
    issueCode: Components.Schemas.IssueCodes,
    message: Swift.String? = nil,
    value: Swift.String? = nil
)
```

Creates a new `TranscodingMessageModel`.

- Parameters:
  - timeStamp:
  - level:
  - issueCode:
  - message:
  - value:

#### Parameters

| Name | Description |
| ---- | ----------- |
| timeStamp |  |
| level |  |
| issueCode |  |
| message |  |
| value |  |