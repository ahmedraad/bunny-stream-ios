**STRUCT**

# `Schemas.VideoStatisticsModel`

```swift
public struct VideoStatisticsModel: Codable, Hashable, Sendable
```

- Remark: Generated from `#/components/schemas/VideoStatisticsModel`.

## Properties
### `viewsChart`

```swift
public var viewsChart: Components.Schemas.VideoStatisticsModel.viewsChartPayload?
```

The constructed chart of checked requests threats

- Remark: Generated from `#/components/schemas/VideoStatisticsModel/viewsChart`.

### `watchTimeChart`

```swift
public var watchTimeChart: Components.Schemas.VideoStatisticsModel.watchTimeChartPayload?
```

The constructed chart of the total watch time

- Remark: Generated from `#/components/schemas/VideoStatisticsModel/watchTimeChart`.

### `countryViewCounts`

```swift
public var countryViewCounts: Components.Schemas.VideoStatisticsModel.countryViewCountsPayload?
```

The country view count constructed chart

- Remark: Generated from `#/components/schemas/VideoStatisticsModel/countryViewCounts`.

### `countryWatchTime`

```swift
public var countryWatchTime: Components.Schemas.VideoStatisticsModel.countryWatchTimePayload?
```

The country watch time constructed chart

- Remark: Generated from `#/components/schemas/VideoStatisticsModel/countryWatchTime`.

### `engagementScore`

```swift
public var engagementScore: Swift.Int32
```

- Remark: Generated from `#/components/schemas/VideoStatisticsModel/engagementScore`.

## Methods
### `init(viewsChart:watchTimeChart:countryViewCounts:countryWatchTime:engagementScore:)`

```swift
public init(
    viewsChart: Components.Schemas.VideoStatisticsModel.viewsChartPayload? = nil,
    watchTimeChart: Components.Schemas.VideoStatisticsModel.watchTimeChartPayload? = nil,
    countryViewCounts: Components.Schemas.VideoStatisticsModel.countryViewCountsPayload? = nil,
    countryWatchTime: Components.Schemas.VideoStatisticsModel.countryWatchTimePayload? = nil,
    engagementScore: Swift.Int32
)
```

Creates a new `VideoStatisticsModel`.

- Parameters:
  - viewsChart: The constructed chart of checked requests threats
  - watchTimeChart: The constructed chart of the total watch time
  - countryViewCounts: The country view count constructed chart
  - countryWatchTime: The country watch time constructed chart
  - engagementScore:

#### Parameters

| Name | Description |
| ---- | ----------- |
| viewsChart | The constructed chart of checked requests threats |
| watchTimeChart | The constructed chart of the total watch time |
| countryViewCounts | The country view count constructed chart |
| countryWatchTime | The country watch time constructed chart |
| engagementScore |  |