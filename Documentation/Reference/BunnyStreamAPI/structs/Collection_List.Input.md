**STRUCT**

# `Collection_List.Input`

```swift
public struct Input: Sendable, Hashable
```

## Properties
### `path`

```swift
public var path: Operations.Collection_List.Input.Path
```

### `query`

```swift
public var query: Operations.Collection_List.Input.Query
```

### `headers`

```swift
public var headers: Operations.Collection_List.Input.Headers
```

## Methods
### `init(path:query:headers:)`

```swift
public init(
    path: Operations.Collection_List.Input.Path,
    query: Operations.Collection_List.Input.Query = .init(),
    headers: Operations.Collection_List.Input.Headers = .init()
)
```

Creates a new `Input`.

- Parameters:
  - path:
  - query:
  - headers:

#### Parameters

| Name | Description |
| ---- | ----------- |
| path |  |
| query |  |
| headers |  |