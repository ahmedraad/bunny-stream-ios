**ENUM**

# `Ok.Body`

```swift
@frozen public enum Body: Sendable, Hashable
```

- Remark: Generated from `#/paths/library/{libraryId}/videos/{videoId}/captions/{srclang}/DELETE/responses/200/content`.

## Cases
### `json(_:)`

```swift
case json(Components.Schemas.StatusModel)
```

- Remark: Generated from `#/paths/library/{libraryId}/videos/{videoId}/captions/{srclang}/DELETE/responses/200/content/application\/json`.

### `xml(_:)`

```swift
case xml(OpenAPIRuntime.HTTPBody)
```

- Remark: Generated from `#/paths/library/{libraryId}/videos/{videoId}/captions/{srclang}/DELETE/responses/200/content/application\/xml`.

## Properties
### `json`

```swift
public var json: Components.Schemas.StatusModel
```

The associated value of the enum case if `self` is `.json`.

- Throws: An error if `self` is not `.json`.
- SeeAlso: `.json`.

### `xml`

```swift
public var xml: OpenAPIRuntime.HTTPBody
```

The associated value of the enum case if `self` is `.xml`.

- Throws: An error if `self` is not `.xml`.
- SeeAlso: `.xml`.
