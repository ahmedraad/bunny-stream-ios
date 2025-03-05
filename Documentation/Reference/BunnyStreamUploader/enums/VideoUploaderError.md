**ENUM**

# `VideoUploaderError`

```swift
public enum VideoUploaderError: LocalizedError
```

An enumeration of errors that can occur during video upload operations.

`VideoUploaderError` implements `LocalizedError` to provide human-readable error messages
for various failure scenarios that may occur during the video upload process.

## Cases
### `failedToCreateVideoWithReason(message:)`

```swift
case failedToCreateVideoWithReason(message: String)
```

Indicates a failure to create a video with a specific error message.

- Parameter message: A detailed message explaining why the video creation failed.

### `failedToCreateVideo`

```swift
case failedToCreateVideo
```

Indicates a general failure in creating a video without a specific reason.

### `failedToUploadVideo`

```swift
case failedToUploadVideo
```

Indicates a failure during the video upload process.

### `failedToCreateRequest`

```swift
case failedToCreateRequest
```

Indicates a failure in creating the network request for the upload.

### `failedToCreateUploadTask`

```swift
case failedToCreateUploadTask
```

Indicates a failure in creating the upload task.

### `invalidVideoUUID`

```swift
case invalidVideoUUID
```

Indicates that the provided video UUID is invalid.

## Properties
### `errorDescription`

```swift
public var errorDescription: String?
```

A localized description of the error suitable for displaying to users.

This property provides human-readable error messages that can be displayed
in the user interface or logged for debugging purposes.
