**STRUCT**

# `Schemas.MomentModel`

```swift
public struct MomentModel: Codable, Hashable, Sendable
```

- Remark: Generated from `#/components/schemas/MomentModel`.

## Properties
### `label`

```swift
public var label: Swift.String
```

The text description label for the chapter

- Remark: Generated from `#/components/schemas/MomentModel/label`.

### `timestamp`

```swift
public var timestamp: Swift.Int32
```

The timestamp of the moment in seconds

- Remark: Generated from `#/components/schemas/MomentModel/timestamp`.

## Methods
### `init(label:timestamp:)`

```swift
public init(label: Swift.String, timestamp: Swift.Int32)
```

Creates a new `MomentModel`.

- Parameters:
  - label: The text description label for the chapter
  - timestamp: The timestamp of the moment in seconds

#### Parameters

| Name | Description |
| ---- | ----------- |
| label | The text description label for the chapter |
| timestamp | The timestamp of the moment in seconds |