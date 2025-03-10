# BunnyStreamUploader

[![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)](https://www.swift.org)
[![License](https://img.shields.io/badge/Licence-MIT-green.svg)](LICENSE)

## Overview

BunnyStreamUploader is a sophisticated video upload solution built on the TUS (Tus Upload Server) protocol. This package ensures reliable file uploads even in challenging network conditions, with comprehensive support for pause/resume functionality and background uploads.

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
