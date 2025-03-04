**EXTENSION**

# `URLSessionVideoUploader`
```swift
public extension URLSessionVideoUploader
```

## Methods
### `make(accessKey:)`

```swift
static func make(accessKey: String) -> URLSessionVideoUploader
```

Upload video files using URLSession
- Parameter accessKey: Bunny net access key
- Returns: URLSessionVideoUploader instance

#### Parameters

| Name | Description |
| ---- | ----------- |
| accessKey | Bunny net access key |

### `uploadVideos(with:)`

```swift
public func uploadVideos(with infos: [VideoInfo]) async throws
```

#### Parameters

| Name | Description |
| ---- | ----------- |
| infos | multiple video informations |

### `pauseUpload(for:)`

```swift
public func pauseUpload(for info: UploadVideoInfo)
```

#### Parameters

| Name | Description |
| ---- | ----------- |
| info | specific video info |

### `resumeUpload(for:)`

```swift
public func resumeUpload(for info: UploadVideoInfo)
```

#### Parameters

| Name | Description |
| ---- | ----------- |
| info | specific video info |

### `removeUpload(for:)`

```swift
public func removeUpload(for info: UploadVideoInfo)
```

#### Parameters

| Name | Description |
| ---- | ----------- |
| info | specific video info |

### `urlSession(_:task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:)`

```swift
public func urlSession(_ session: URLSession,
                       task: URLSessionTask,
                       didSendBodyData bytesSent: Int64,
                       totalBytesSent: Int64,
                       totalBytesExpectedToSend: Int64)
```
