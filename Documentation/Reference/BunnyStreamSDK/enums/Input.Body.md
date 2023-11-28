**ENUM**

# `Input.Body`

```swift
@frozen public enum Body: Sendable, Hashable
```

- Remark: Generated from `#/paths/library/{libraryId}/videos/{videoId}/captions/{srclang}/POST/requestBody`.

## Cases
### `json(_:)`

```swift
case json(Components.Schemas.CaptionModelAdd)
```

- Remark: Generated from `#/paths/library/{libraryId}/videos/{videoId}/captions/{srclang}/POST/requestBody/content/application\/json`.

### `text_json(_:)`

```swift
case text_json(OpenAPIRuntime.HTTPBody)
```

- Remark: Generated from `#/paths/library/{libraryId}/videos/{videoId}/captions/{srclang}/POST/requestBody/content/text\/json`.

### `application__ast__plus_json(_:)`

```swift
case application__ast__plus_json(Components.Schemas.CaptionModelAdd)
```

- Remark: Generated from `#/paths/library/{libraryId}/videos/{videoId}/captions/{srclang}/POST/requestBody/content/application\/*+json`.
