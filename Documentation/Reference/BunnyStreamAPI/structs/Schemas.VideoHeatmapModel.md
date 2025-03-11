**STRUCT**

# `Schemas.VideoHeatmapModel`

```swift
public struct VideoHeatmapModel: Codable, Hashable, Sendable
```

- Remark: Generated from `#/components/schemas/VideoHeatmapModel`.

## Properties
### `heatmap`

```swift
public var heatmap: Components.Schemas.VideoHeatmapModel.heatmapPayload?
```

The heatmap of the video. 100 is the highest percentage of watch time.

- Remark: Generated from `#/components/schemas/VideoHeatmapModel/heatmap`.

### `additionalProperties`

```swift
public var additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer
```

A container of undocumented properties.

## Methods
### `init(heatmap:additionalProperties:)`

```swift
public init(
    heatmap: Components.Schemas.VideoHeatmapModel.heatmapPayload? = nil,
    additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer = .init()
)
```

Creates a new `VideoHeatmapModel`.

- Parameters:
  - heatmap: The heatmap of the video. 100 is the highest percentage of watch time.
  - additionalProperties: A container of undocumented properties.

#### Parameters

| Name | Description |
| ---- | ----------- |
| heatmap | The heatmap of the video. 100 is the highest percentage of watch time. |
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