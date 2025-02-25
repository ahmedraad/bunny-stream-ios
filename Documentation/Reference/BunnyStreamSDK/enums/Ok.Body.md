**ENUM**

# `Ok.Body`

```swift
@frozen public enum Body: Sendable, Hashable
```

- Remark: Generated from `#/paths/OEmbed/GET/responses/200/content`.

## Cases
### `json(_:)`

```swift
case json(Components.Schemas.VideoOEmbedModel)
```

- Remark: Generated from `#/paths/OEmbed/GET/responses/200/content/application\/json`.

## Properties
### `json`

```swift
public var json: Components.Schemas.VideoOEmbedModel
```

The associated value of the enum case if `self` is `.json`.

- Throws: An error if `self` is not `.json`.
- SeeAlso: `.json`.
