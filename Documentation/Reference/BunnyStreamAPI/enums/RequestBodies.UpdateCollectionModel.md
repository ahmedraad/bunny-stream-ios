**ENUM**

# `RequestBodies.UpdateCollectionModel`

```swift
@frozen public enum UpdateCollectionModel: Sendable, Hashable
```

- Remark: Generated from `#/components/requestBodies/UpdateCollectionModel`.

## Cases
### `json(_:)`

```swift
case json(Components.Schemas.UpdateCollectionModel)
```

- Remark: Generated from `#/components/requestBodies/UpdateCollectionModel/content/application\/json`.

### `text_json(_:)`

```swift
case text_json(OpenAPIRuntime.HTTPBody)
```

- Remark: Generated from `#/components/requestBodies/UpdateCollectionModel/content/text\/json`.

### `application__ast__plus_json(_:)`

```swift
case application__ast__plus_json(Components.Schemas.UpdateCollectionModel)
```

- Remark: Generated from `#/components/requestBodies/UpdateCollectionModel/content/application\/*+json`.
