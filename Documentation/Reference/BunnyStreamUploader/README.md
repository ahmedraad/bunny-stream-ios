# BunnyStreamUploader

[![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)](https://www.swift.org)
[![License](https://img.shields.io/badge/Licence-MIT-green.svg)](LICENSE)

## Overview

BunnyStreamUploader is a sophisticated video upload solution that offers two distinct methods for integrating video uploads into your iOS applications. You can choose between a TUS-based implementation and a plain URLSession-based uploader. The TUS option ensures reliable file uploads even in challenging network conditions, with comprehensive support for pause/resume functionality, background uploads, automatic retries, and chunked upload handling. Alternatively, the URLSession-based uploader provides a straightforward, lightweight solution ideal for scenarios where the advanced features of TUS are not necessary. Both approaches include robust upload progress tracking and detailed status information, allowing you to select the best method for your specific needs.

### Features

- TUS protocol implementation for reliable uploads
- Pause and resume functionality
- Background upload support
- Upload progress tracking
- Automatic retry mechanism
- Chunked upload support
- Detailed upload status information
- Network condition handling

### Requirements

- iOS 15.0+ / macOS 13.0+
- Swift 5.9+
- Xcode 13.0+

### Required Permissions

```xml
<!-- For video upload and background processing -->
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>

<key>UIBackgroundModes</key>
<array>
    <string>fetch</string>
    <string>processing</string>
</array>
```

### Usage Example

1. TUS-based Uploader

```swift
import BunnyStreamUploader

// Create uploader instance
let videoUploader = TUSVideoUploader.make(accessKey: "your_access_key")

// Prepare video info
let videoInfo = VideoInfo(
    content: .data(video.data),
    title: video.name,
    fileType: video.type,
    videoId: videoId,
    libraryId: libraryId
)

// Start upload with progress tracking
Task {
    do {
        try await videoUploader.uploadVideos(with: [videoInfo]) { progress in
            print("Upload progress: \(progress.fractionCompleted)")
        }
        print("Upload completed successfully!")
    } catch {
        print("Upload error: \(error)")
    }
}
```

2. URLSession-based Uploader

```swift
import BunnyStreamUploader

// Create uploader instance using URLSession-based implementation
let uploader = URLSessionVideoUploader.make(accessKey: "your-bunny-cdn-key")

// Start upload using URLSession uploader with video info
Task {
    do {
        try await uploader.uploadVideos(with: [myVideoInfo])
        print("Upload completed successfully using URLSession!")
    } catch {
        print("Upload error using URLSession: \(error)")
    }
}
```

---

# Reference Documentation

## Protocols
-   [UploadTrackerDelegate](protocols/UploadTrackerDelegate.md)
-   [VideoUploadable](protocols/VideoUploadable.md)
-   [VideoUploaderActions](protocols/VideoUploaderActions.md)
## Structs
-   [UploadProgress](structs/UploadProgress.md)
-   [UploadVideoInfo](structs/UploadVideoInfo.md)
-   [VideoInfo](structs/VideoInfo.md)
## Classes
-   [TUSVideoUploader](classes/TUSVideoUploader.md)
-   [URLSessionVideoUploader](classes/URLSessionVideoUploader.md)
-   [UploadTracker](classes/UploadTracker.md)
-   [UploadTrackerObservable](classes/UploadTrackerObservable.md)
## Enums
-   [UploadStatus](enums/UploadStatus.md)
-   [VideoContent](enums/VideoContent.md)
-   [VideoUploaderError](enums/VideoUploaderError.md)
## Extensions
-   [VideoUploadable](extensions/VideoUploadable.md)
## Typealiases
-   [Headers](typealiases/Headers.md)
-   [VideoUploader](typealiases/VideoUploader.md)

Copyright (c) 2019 BunnyWay d.o.o.
