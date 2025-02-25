**ENUM**

# `Value2Payload.dataPayload`

```swift
@frozen public enum dataPayload: Codable, Hashable, Sendable
```

- Remark: Generated from `#/components/schemas/StatusModelOfVideoResolutionsInfoModel/value2/data`.

## Cases
### `VideoResolutionsInfoModel(_:)`

```swift
case VideoResolutionsInfoModel(Components.Schemas.VideoResolutionsInfoModel)
```

- Remark: Generated from `#/components/schemas/StatusModelOfVideoResolutionsInfoModel/value2/data/case1`.

## Methods
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