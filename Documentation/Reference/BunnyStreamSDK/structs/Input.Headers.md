**STRUCT**

# `Input.Headers`

```swift
public struct Headers: Sendable, Hashable
```

- Remark: Generated from `#/paths/library/{libraryId}/videos/{videoId}/captions/{srclang}/DELETE/header`.

## Properties
### `accept`

```swift
public var accept:
    [OpenAPIRuntime.AcceptHeaderContentType<Operations.Video_DeleteCaption.AcceptableContentType>]
```

## Methods
### `init(accept:)`

```swift
public init(
    accept: [OpenAPIRuntime.AcceptHeaderContentType<
        Operations.Video_DeleteCaption.AcceptableContentType
    >] = .defaultValues()
)
```

Creates a new `Headers`.

- Parameters:
  - accept:

#### Parameters

| Name | Description |
| ---- | ----------- |
| accept |  |