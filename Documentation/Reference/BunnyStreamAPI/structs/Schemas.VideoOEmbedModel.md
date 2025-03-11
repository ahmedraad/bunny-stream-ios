**STRUCT**

# `Schemas.VideoOEmbedModel`

```swift
public struct VideoOEmbedModel: Codable, Hashable, Sendable
```

- Remark: Generated from `#/components/schemas/VideoOEmbedModel`.

## Properties
### `version`

```swift
public var version: Swift.String?
```

- Remark: Generated from `#/components/schemas/VideoOEmbedModel/version`.

### `title`

```swift
public var title: Swift.String?
```

- Remark: Generated from `#/components/schemas/VideoOEmbedModel/title`.

### `_type`

```swift
public var _type: Swift.String?
```

- Remark: Generated from `#/components/schemas/VideoOEmbedModel/type`.

### `thumbnailUrl`

```swift
public var thumbnailUrl: Swift.String?
```

- Remark: Generated from `#/components/schemas/VideoOEmbedModel/thumbnailUrl`.

### `width`

```swift
public var width: Swift.Int32?
```

- Remark: Generated from `#/components/schemas/VideoOEmbedModel/width`.

### `height`

```swift
public var height: Swift.Int32?
```

- Remark: Generated from `#/components/schemas/VideoOEmbedModel/height`.

### `html`

```swift
public var html: Swift.String?
```

- Remark: Generated from `#/components/schemas/VideoOEmbedModel/html`.

### `providerName`

```swift
public var providerName: Swift.String?
```

- Remark: Generated from `#/components/schemas/VideoOEmbedModel/providerName`.

### `providerUrl`

```swift
public var providerUrl: Swift.String?
```

- Remark: Generated from `#/components/schemas/VideoOEmbedModel/providerUrl`.

### `additionalProperties`

```swift
public var additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer
```

A container of undocumented properties.

## Methods
### `init(version:title:_type:thumbnailUrl:width:height:html:providerName:providerUrl:additionalProperties:)`

```swift
public init(
    version: Swift.String? = nil,
    title: Swift.String? = nil,
    _type: Swift.String? = nil,
    thumbnailUrl: Swift.String? = nil,
    width: Swift.Int32? = nil,
    height: Swift.Int32? = nil,
    html: Swift.String? = nil,
    providerName: Swift.String? = nil,
    providerUrl: Swift.String? = nil,
    additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer = .init()
)
```

Creates a new `VideoOEmbedModel`.

- Parameters:
  - version:
  - title:
  - _type:
  - thumbnailUrl:
  - width:
  - height:
  - html:
  - providerName:
  - providerUrl:
  - additionalProperties: A container of undocumented properties.

#### Parameters

| Name | Description |
| ---- | ----------- |
| version |  |
| title |  |
| _type |  |
| thumbnailUrl |  |
| width |  |
| height |  |
| html |  |
| providerName |  |
| providerUrl |  |
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