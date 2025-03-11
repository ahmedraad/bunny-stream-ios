# BunnyStreamCameraUpload

[![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)](https://www.swift.org)
[![License](https://img.shields.io/badge/Licence-MIT-green.svg)](LICENSE)

## Overview

BunnyStreamCameraUpload is a comprehensive camera integration solution that enables recording and direct upload of videos from the device camera. It provides an easy-to-use SwiftUI interface for video recording and seamless upload integration.

### Features

- Direct camera recording
- Video upload integration
- Camera controls
- Recording management
- SwiftUI integration
- Background upload support

### Requirements

- iOS 15.0+ / macOS 13.0+
- Swift 5.9+
- Xcode 13.0+

### Required Permissions

```xml
<!-- For camera and microphone access -->
<key>NSCameraUsageDescription</key>
<string>Camera access is required for video recording</string>

<key>NSMicrophoneUsageDescription</key>
<string>Microphone access is required for video recording</string>

<!-- For background upload support -->
<key>UIBackgroundModes</key>
<array>
    <string>fetch</string>
    <string>processing</string>
</array>
```

### Usage example

To integrate the camera upload feature into your app, simply present the BunnyStreamCameraUploadView using SwiftUI’s full-screen cover. This view provides a seamless interface for recording and uploading videos directly from the device camera.

```swift
import BunnyStreamCameraUpload

struct VideoStreamDemoView: View {
  @State private var isStreamingPresented = false

  var body: some View {
    Group { }
      .fullScreenCover(isPresented: $isStreamingPresented,
                       content: {
        BunnyStreamCameraUploadView(
          accessKey: "<access_key>",
          libraryId: <library_id>
        )
      })
  }
}
```
