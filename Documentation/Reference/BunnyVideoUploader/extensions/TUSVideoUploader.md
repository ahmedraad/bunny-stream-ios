**EXTENSION**

# `TUSVideoUploader`
```swift
public extension TUSVideoUploader
```

## Methods
### `make(accessKey:chunkSize:)`

```swift
static func make(accessKey: String, chunkSize: Int = 500 * 1024) -> TUSVideoUploader
```

Create an instance of TUSVideoUploader
- Parameters:
  - accessKey: Bunny net access key
  - chunkSize: The amount of bytes the data to upload will be chunked by. Defaults to 512 kB.
- Returns: TUSVideoUploader instance

#### Parameters

| Name | Description |
| ---- | ----------- |
| accessKey | Bunny net access key |
| chunkSize | The amount of bytes the data to upload will be chunked by. Defaults to 512 kB. |

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
public func pauseUpload(for info: UploadVideoInfo) throws
```

#### Parameters

| Name | Description |
| ---- | ----------- |
| info | specific video info |

### `resumeUpload(for:)`

```swift
public func resumeUpload(for info: UploadVideoInfo) throws
```

#### Parameters

| Name | Description |
| ---- | ----------- |
| info | specific video info |

### `removeUpload(for:)`

```swift
public func removeUpload(for info: UploadVideoInfo) throws
```

#### Parameters

| Name | Description |
| ---- | ----------- |
| info | specific video info |

### `start()`

```swift
func start() throws
```

### `registerBackgroundHandler(_:forSession:)`

```swift
func registerBackgroundHandler(_ handler: @escaping () -> Void,
                               forSession sessionIdentifier: String)
```

### `progressFor(id:context:bytesUploaded:totalBytes:client:)`

```swift
public func progressFor(id: UUID, context: [String: String]?, bytesUploaded: Int, totalBytes: Int, client: TUSClient)
```

### `didStartUpload(id:context:client:)`

```swift
public func didStartUpload(id: UUID, context: [String : String]?, client: TUSClient)
```

### `didFinishUpload(id:url:context:client:)`

```swift
public func didFinishUpload(id: UUID, url: URL, context: [String : String]?, client: TUSClient)
```

### `uploadFailed(id:error:context:client:)`

```swift
public func uploadFailed(id: UUID, error: Error, context: [String : String]?, client: TUSClient)
```

### `fileError(error:client:)`

```swift
public func fileError(error: TUSClientError, client: TUSClient)
```

### `totalProgress(bytesUploaded:totalBytes:client:)`

```swift
public func totalProgress(bytesUploaded: Int, totalBytes: Int, client: TUSClient)
```
