**STRUCT**

# `Schemas.StatusModel`

```swift
public struct StatusModel: Codable, Hashable, Sendable
```

- Remark: Generated from `#/components/schemas/StatusModel`.

## Properties
### `success`

```swift
public var success: Swift.Bool
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
public var statusCode: Swift.Int32
```

The response status code

- Remark: Generated from `#/components/schemas/StatusModel/statusCode`.

## Methods
### `init(success:message:statusCode:)`

```swift
public init(success: Swift.Bool, message: Swift.String? = nil, statusCode: Swift.Int32)
```

Creates a new `StatusModel`.

- Parameters:
  - success: Determines if the request was successful
  - message: Response message description
  - statusCode: The response status code

#### Parameters

| Name | Description |
| ---- | ----------- |
| success | Determines if the request was successful |
| message | Response message description |
| statusCode | The response status code |