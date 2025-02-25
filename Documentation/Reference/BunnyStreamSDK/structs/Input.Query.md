**STRUCT**

# `Input.Query`

```swift
public struct Query: Sendable, Hashable
```

- Remark: Generated from `#/paths/OEmbed/GET/query`.

## Properties
### `url`

```swift
public var url: Swift.String?
```

- Remark: Generated from `#/paths/OEmbed/GET/query/url`.

### `maxWidth`

```swift
public var maxWidth: Swift.Int32?
```

- Remark: Generated from `#/paths/OEmbed/GET/query/maxWidth`.

### `maxHeight`

```swift
public var maxHeight: Swift.Int32?
```

- Remark: Generated from `#/paths/OEmbed/GET/query/maxHeight`.

### `token`

```swift
public var token: Swift.String?
```

- Remark: Generated from `#/paths/OEmbed/GET/query/token`.

### `expires`

```swift
public var expires: Swift.Int64?
```

- Remark: Generated from `#/paths/OEmbed/GET/query/expires`.

## Methods
### `init(url:maxWidth:maxHeight:token:expires:)`

```swift
public init(
    url: Swift.String? = nil,
    maxWidth: Swift.Int32? = nil,
    maxHeight: Swift.Int32? = nil,
    token: Swift.String? = nil,
    expires: Swift.Int64? = nil
)
```

Creates a new `Query`.

- Parameters:
  - url:
  - maxWidth:
  - maxHeight:
  - token:
  - expires:

#### Parameters

| Name | Description |
| ---- | ----------- |
| url |  |
| maxWidth |  |
| maxHeight |  |
| token |  |
| expires |  |