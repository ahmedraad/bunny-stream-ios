**ENUM**

# `Video_List.AcceptableContentType`

```swift
@frozen public enum AcceptableContentType: AcceptableProtocol
```

## Cases
### `json`

```swift
case json
```

### `xml`

```swift
case xml
```

### `other(_:)`

```swift
case other(String)
```

## Properties
### `rawValue`

```swift
public var rawValue: String
```

### `allCases`

```swift
public static var allCases: [Self]
```

## Methods
### `init(rawValue:)`

```swift
public init?(rawValue: String)
```

#### Parameters

| Name | Description |
| ---- | ----------- |
| rawValue | The raw value to use for the new instance. |