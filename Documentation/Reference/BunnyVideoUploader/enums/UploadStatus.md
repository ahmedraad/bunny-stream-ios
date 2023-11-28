**ENUM**

# `UploadStatus`

```swift
public enum UploadStatus: Equatable
```

## Cases
### `paused(progress:)`

```swift
case paused(progress: UploadProgress)
```

### `uploading(progress:)`

```swift
case uploading(progress: UploadProgress)
```

### `failed(error:)`

```swift
case failed(error: String)
```

### `uploaded(url:)`

```swift
case uploaded(url: URL)
```

### `removed`

```swift
case removed
```
