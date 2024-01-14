**STRUCT**

# `Schemas.FetchVideoRequest`

```swift
public struct FetchVideoRequest: Codable, Hashable, Sendable
```

- Remark: Generated from `#/components/schemas/FetchVideoRequest`.

## Properties
### `url`

```swift
public var url: Swift.String
```

The URL from which the video will be fetched from.

- Remark: Generated from `#/components/schemas/FetchVideoRequest/url`.

### `headers`

```swift
public var headers: Components.Schemas.FetchVideoRequest.headersPayload?
```

The headers that will be sent along with the fetch request.

- Remark: Generated from `#/components/schemas/FetchVideoRequest/headers`.

### `title`

```swift
public var title: Swift.String?
```

The title that will be set to video.

- Remark: Generated from `#/components/schemas/FetchVideoRequest/title`.

## Methods
### `init(url:headers:title:)`

```swift
public init(
    url: Swift.String,
    headers: Components.Schemas.FetchVideoRequest.headersPayload? = nil,
    title: Swift.String? = nil
)
```

Creates a new `FetchVideoRequest`.

- Parameters:
  - url: The URL from which the video will be fetched from.
  - headers: The headers that will be sent along with the fetch request.
  - title: The title that will be set to video.

#### Parameters

| Name | Description |
| ---- | ----------- |
| url | The URL from which the video will be fetched from. |
| headers | The headers that will be sent along with the fetch request. |
| title | The title that will be set to video. |