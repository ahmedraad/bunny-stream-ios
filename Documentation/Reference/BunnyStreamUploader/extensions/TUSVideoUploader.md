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

Creates a preconfigured instance of TUSVideoUploader for use with BunnyCDN.

This factory method sets up a complete video uploader with:
- A configured TUS client for BunnyCDN's upload endpoint
- Background upload support
- Automatic upload resumption
- Progress tracking

Example usage:
```swift
let uploader = TUSVideoUploader.make(
    accessKey: "your-bunny-cdn-key",
    chunkSize: 1024 * 1024 // 1MB chunks
)
```

- Parameters:
  - accessKey: Your BunnyCDN API access key for authentication.
  - chunkSize: The size of upload chunks in bytes. Larger chunks may upload faster
               but use more memory. Defaults to 500KB (500 * 1024 bytes).
- Returns: A fully configured TUSVideoUploader instance ready for use.
- Note: The uploader is automatically started after creation and will attempt to
        resume any previously interrupted uploads.

#### Parameters

| Name | Description |
| ---- | ----------- |
| accessKey | Your BunnyCDN API access key for authentication. |
| chunkSize | The size of upload chunks in bytes. Larger chunks may upload faster but use more memory. Defaults to 500KB (500 * 1024 bytes). |

### `uploadVideos(with:)`

```swift
public func uploadVideos(with infos: [VideoInfo]) async throws
```

Uploads multiple videos using the TUS protocol.

This method processes each video sequentially, preparing the necessary headers
and initiating the TUS upload process. For each video:
1. Generates authentication headers
2. Initiates the upload
3. Registers the upload with the tracker

- Parameter infos: An array of video information objects to upload.
- Throws: `VideoUploaderError.failedToUploadVideo` if the upload cannot be initiated.

#### Parameters

| Name | Description |
| ---- | ----------- |
| infos | An array of video information objects to upload. |

### `pauseUpload(for:)`

```swift
public func pauseUpload(for info: UploadVideoInfo) throws
```

Pauses an ongoing upload.

This method cancels the TUS upload operation and updates the tracker to reflect
the paused state. The upload can be resumed later using `resumeUpload(for:)`.

- Parameter info: The information about the upload to pause.
- Throws: An error if the TUS client fails to cancel the upload.

#### Parameters

| Name | Description |
| ---- | ----------- |
| info | The information about the upload to pause. |

### `resumeUpload(for:)`

```swift
public func resumeUpload(for info: UploadVideoInfo) throws
```

Resumes a previously paused upload.

This method restarts the TUS upload operation from where it was paused
and updates the tracker to reflect the resumed state.

- Parameter info: The information about the upload to resume.
- Throws: An error if the TUS client fails to resume the upload.

#### Parameters

| Name | Description |
| ---- | ----------- |
| info | The information about the upload to resume. |

### `removeUpload(for:)`

```swift
public func removeUpload(for info: UploadVideoInfo) throws
```

Permanently removes an upload.

This method:
1. Cancels any ongoing upload operation
2. Removes the upload from the TUS client's cache
3. Removes the upload from the tracker

- Parameter info: The information about the upload to remove.
- Throws: An error if the TUS client operations fail.

#### Parameters

| Name | Description |
| ---- | ----------- |
| info | The information about the upload to remove. |

### `start()`

```swift
func start() throws
```

Starts the TUS client and processes any existing uploads.

This method:
1. Starts the TUS client
2. Attempts to retry any failed uploads
3. Restores any stored uploads from previous sessions
4. Performs cleanup of the TUS client

- Throws: An error if the TUS client fails to start.

### `registerBackgroundHandler(_:forSession:)`

```swift
func registerBackgroundHandler(_ handler: @escaping () -> Void,
                               forSession sessionIdentifier: String)
```

Registers a handler for background upload operations.

This method sets up the necessary handling for uploads to continue
when the app is in the background.

- Parameters:
  - handler: A closure to be called when background operations occur.
  - sessionIdentifier: The identifier for the background session.

#### Parameters

| Name | Description |
| ---- | ----------- |
| handler | A closure to be called when background operations occur. |
| sessionIdentifier | The identifier for the background session. |

### `progressFor(id:context:bytesUploaded:totalBytes:client:)`

```swift
public func progressFor(id: UUID, context: [String: String]?, bytesUploaded: Int, totalBytes: Int, client: TUSClient)
```

Updates the upload progress for a specific upload.

- Parameters:
  - id: The identifier of the upload.
  - context: Additional context information from the TUS client.
  - bytesUploaded: The number of bytes uploaded so far.
  - totalBytes: The total number of bytes to upload.
  - client: The TUS client reporting the progress.

#### Parameters

| Name | Description |
| ---- | ----------- |
| id | The identifier of the upload. |
| context | Additional context information from the TUS client. |
| bytesUploaded | The number of bytes uploaded so far. |
| totalBytes | The total number of bytes to upload. |
| client | The TUS client reporting the progress. |

### `didStartUpload(id:context:client:)`

```swift
public func didStartUpload(id: UUID, context: [String : String]?, client: TUSClient)
```

Handles the start of an upload operation.

- Parameters:
  - id: The identifier of the upload.
  - context: Additional context information from the TUS client.
  - client: The TUS client that started the upload.

#### Parameters

| Name | Description |
| ---- | ----------- |
| id | The identifier of the upload. |
| context | Additional context information from the TUS client. |
| client | The TUS client that started the upload. |

### `didFinishUpload(id:url:context:client:)`

```swift
public func didFinishUpload(id: UUID, url: URL, context: [String : String]?, client: TUSClient)
```

Handles the successful completion of an upload.

- Parameters:
  - id: The identifier of the completed upload.
  - url: The URL where the uploaded file can be accessed.
  - context: Additional context information from the TUS client.
  - client: The TUS client that completed the upload.

#### Parameters

| Name | Description |
| ---- | ----------- |
| id | The identifier of the completed upload. |
| url | The URL where the uploaded file can be accessed. |
| context | Additional context information from the TUS client. |
| client | The TUS client that completed the upload. |

### `uploadFailed(id:error:context:client:)`

```swift
public func uploadFailed(id: UUID, error: Error, context: [String : String]?, client: TUSClient)
```

Handles upload failures.

- Parameters:
  - id: The identifier of the failed upload.
  - error: The error that caused the failure.
  - context: Additional context information from the TUS client.
  - client: The TUS client reporting the failure.

#### Parameters

| Name | Description |
| ---- | ----------- |
| id | The identifier of the failed upload. |
| error | The error that caused the failure. |
| context | Additional context information from the TUS client. |
| client | The TUS client reporting the failure. |

### `fileError(error:client:)`

```swift
public func fileError(error: TUSClientError, client: TUSClient)
```

Handles file-related errors.

- Parameters:
  - error: The file error that occurred.
  - client: The TUS client reporting the error.

#### Parameters

| Name | Description |
| ---- | ----------- |
| error | The file error that occurred. |
| client | The TUS client reporting the error. |

### `totalProgress(bytesUploaded:totalBytes:client:)`

```swift
public func totalProgress(bytesUploaded: Int, totalBytes: Int, client: TUSClient)
```

Handles overall upload progress across all uploads.

- Parameters:
  - bytesUploaded: The total number of bytes uploaded across all uploads.
  - totalBytes: The total number of bytes to upload across all uploads.
  - client: The TUS client reporting the progress.

#### Parameters

| Name | Description |
| ---- | ----------- |
| bytesUploaded | The total number of bytes uploaded across all uploads. |
| totalBytes | The total number of bytes to upload across all uploads. |
| client | The TUS client reporting the progress. |