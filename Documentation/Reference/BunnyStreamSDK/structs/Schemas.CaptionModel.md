**STRUCT**

# `Schemas.CaptionModel`

```swift
public struct CaptionModel: Codable, Hashable, Sendable
```

- Remark: Generated from `#/components/schemas/CaptionModel`.

## Properties
### `srclang`

```swift
public var srclang: Swift.String?
```

The unique srclang shortcode for the caption

- Remark: Generated from `#/components/schemas/CaptionModel/srclang`.

### `label`

```swift
public var label: Swift.String?
```

The text description label for the caption

- Remark: Generated from `#/components/schemas/CaptionModel/label`.

## Methods
### `init(srclang:label:)`

```swift
public init(
    srclang: Swift.String? = nil,
    label: Swift.String? = nil
)
```

Creates a new `CaptionModel`.

- Parameters:
  - srclang: The unique srclang shortcode for the caption
  - label: The text description label for the caption

#### Parameters

| Name | Description |
| ---- | ----------- |
| srclang | The unique srclang shortcode for the caption |
| label | The text description label for the caption |