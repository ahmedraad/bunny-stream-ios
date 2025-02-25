**ENUM**

# `Body.jsonPayload`

```swift
@frozen public enum jsonPayload: Codable, Hashable, Sendable
```

- Remark: Generated from `#/paths/library/{libraryId}/videos/{videoId}/transcribe/POST/requestBody/json`.

## Cases
### `TranscribeSettings(_:)`

```swift
case TranscribeSettings(Components.Schemas.TranscribeSettings)
```

- Remark: Generated from `#/paths/library/{libraryId}/videos/{videoId}/transcribe/POST/requestBody/json/case1`.

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