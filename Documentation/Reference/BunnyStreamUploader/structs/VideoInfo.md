**STRUCT**

# `VideoInfo`

```swift
public struct VideoInfo: Hashable
```

## Properties
### `content`

```swift
public let content: VideoContent
```

### `title`

```swift
public let title: String
```

### `fileType`

```swift
public let fileType: String
```

### `videoId`

```swift
public let videoId: String
```

### `collectionId`

```swift
public let collectionId: String?
```

### `libraryId`

```swift
public let libraryId: Int
```

### `expirationTime`

```swift
public let expirationTime: TimeInterval
```

### `expirationTimeString`

```swift
public var expirationTimeString: String
```

## Methods
### `init(content:title:fileType:videoId:collectionId:libraryId:expirationTime:)`

```swift
public init(content: VideoContent,
            title: String,
            fileType: String,
            videoId: String,
            collectionId: String? = nil,
            libraryId: Int,
            expirationTime: TimeInterval = Date().addingTimeInterval(3600).timeIntervalSince1970)
```
