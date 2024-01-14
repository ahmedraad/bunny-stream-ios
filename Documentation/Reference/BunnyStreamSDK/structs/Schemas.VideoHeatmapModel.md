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

## Methods
### `init(heatmap:)`

```swift
public init(heatmap: Components.Schemas.VideoHeatmapModel.heatmapPayload? = nil)
```

Creates a new `VideoHeatmapModel`.

- Parameters:
  - heatmap: The heatmap of the video. 100 is the highest percentage of watch time.

#### Parameters

| Name | Description |
| ---- | ----------- |
| heatmap | The heatmap of the video. 100 is the highest percentage of watch time. |