**STRUCT**

# `Schemas.CaptionModelAdd`

```swift
public struct CaptionModelAdd: Codable, Hashable, Sendable
```

- Remark: Generated from `#/components/schemas/CaptionModelAdd`.

## Properties
### `srclang`

```swift
public var srclang: Swift.String?
```

The unique srclang shortcode for the caption

- Remark: Generated from `#/components/schemas/CaptionModelAdd/srclang`.

### `label`

```swift
public var label: Swift.String?
```

The text description label for the caption

- Remark: Generated from `#/components/schemas/CaptionModelAdd/label`.

### `captionsFile`

```swift
public var captionsFile: Swift.String?
```

Base64 encoded captions file

- Remark: Generated from `#/components/schemas/CaptionModelAdd/captionsFile`.

## Methods
### `init(srclang:label:captionsFile:)`

```swift
public init(
    srclang: Swift.String? = nil,
    label: Swift.String? = nil,
    captionsFile: Swift.String? = nil
)
```

Creates a new `CaptionModelAdd`.

- Parameters:
  - srclang: The unique srclang shortcode for the caption
  - label: The text description label for the caption
  - captionsFile: Base64 encoded captions file

#### Parameters

| Name | Description |
| ---- | ----------- |
| srclang | The unique srclang shortcode for the caption |
| label | The text description label for the caption |
| captionsFile | Base64 encoded captions file |