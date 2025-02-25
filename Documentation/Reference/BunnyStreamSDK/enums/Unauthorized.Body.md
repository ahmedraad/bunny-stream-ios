**ENUM**

# `Unauthorized.Body`

```swift
@frozen public enum Body: Sendable, Hashable
```

- Remark: Generated from `#/paths/library/{libraryId}/videos/{videoId}/transcribe/POST/responses/401/content`.

## Cases
### `json(_:)`

```swift
case json(Components.Schemas.StatusModel)
```

- Remark: Generated from `#/paths/library/{libraryId}/videos/{videoId}/transcribe/POST/responses/401/content/application\/json`.

## Properties
### `json`

```swift
public var json: Components.Schemas.StatusModel
```

The associated value of the enum case if `self` is `.json`.

- Throws: An error if `self` is not `.json`.
- SeeAlso: `.json`.
