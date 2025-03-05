**STRUCT**

# `UploadProgress`

```swift
public struct UploadProgress: Equatable
```

A structure that represents the progress of a video upload.

`UploadProgress` tracks the number of bytes uploaded and the total size of the upload,
providing a way to calculate the completion percentage of the upload.

## Properties
### `bytesUploaded`

```swift
public let bytesUploaded: Int
```

The number of bytes that have been successfully uploaded.

### `totalBytes`

```swift
public let totalBytes: Int
```

The total number of bytes to be uploaded.

### `fractionCompleted`

```swift
public var fractionCompleted: Double
```

The fraction of the upload that has been completed, represented as a value between 0 and 1.

This property calculates the progress as a ratio of uploaded bytes to total bytes.
For example, a value of 0.5 indicates that 50% of the upload is complete.

### `zero`

```swift
public static var zero: UploadProgress
```

A progress object representing no progress (0 bytes uploaded out of 0 total bytes).

This is typically used as an initial value or to reset progress tracking.
