**STRUCT**

# `Schemas.TranscribeSettings`

```swift
public struct TranscribeSettings: Codable, Hashable, Sendable
```

- Remark: Generated from `#/components/schemas/TranscribeSettings`.

## Properties
### `targetLanguages`

```swift
public var targetLanguages: [Swift.String]?
```

List of languages that will be used as target languages, use ISO 639-1 language codes

- Remark: Generated from `#/components/schemas/TranscribeSettings/targetLanguages`.

### `generateTitle`

```swift
public var generateTitle: Swift.Bool?
```

Whether video title should be automatically generated

- Remark: Generated from `#/components/schemas/TranscribeSettings/generateTitle`.

### `generateDescription`

```swift
public var generateDescription: Swift.Bool?
```

Whether video description should be automatically generated

- Remark: Generated from `#/components/schemas/TranscribeSettings/generateDescription`.

### `sourceLanguage`

```swift
public var sourceLanguage: Swift.String?
```

Video source language, use ISO 639-1 language code. IMPORTANT: This value takes precedence over query param, if specified

- Remark: Generated from `#/components/schemas/TranscribeSettings/sourceLanguage`.

### `additionalProperties`

```swift
public var additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer
```

A container of undocumented properties.

## Methods
### `init(targetLanguages:generateTitle:generateDescription:sourceLanguage:additionalProperties:)`

```swift
public init(
    targetLanguages: [Swift.String]? = nil,
    generateTitle: Swift.Bool? = nil,
    generateDescription: Swift.Bool? = nil,
    sourceLanguage: Swift.String? = nil,
    additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer = .init()
)
```

Creates a new `TranscribeSettings`.

- Parameters:
  - targetLanguages: List of languages that will be used as target languages, use ISO 639-1 language codes
  - generateTitle: Whether video title should be automatically generated
  - generateDescription: Whether video description should be automatically generated
  - sourceLanguage: Video source language, use ISO 639-1 language code. IMPORTANT: This value takes precedence over query param, if specified
  - additionalProperties: A container of undocumented properties.

#### Parameters

| Name | Description |
| ---- | ----------- |
| targetLanguages | List of languages that will be used as target languages, use ISO 639-1 language codes |
| generateTitle | Whether video title should be automatically generated |
| generateDescription | Whether video description should be automatically generated |
| sourceLanguage | Video source language, use ISO 639-1 language code. IMPORTANT: This value takes precedence over query param, if specified |
| additionalProperties | A container of undocumented properties. |

### `init(from:)`

```swift
public init(from decoder: any Decoder) throws
```

#### Parameters

| Name | Description |
| ---- | ----------- |
| decoder | The decoder to read data from. |

### `encode(to:)`

```swift
public func encode(to encoder: any Encoder) throws
```

#### Parameters

| Name | Description |
| ---- | ----------- |
| encoder | The encoder to write data to. |