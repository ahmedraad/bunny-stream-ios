# BunnyNet Stream iOS SDK

<p align="center">
  <img src="Resources/Images/bunnynet.svg" width="70%" alt="BunnyNet" />
</p>
<p align="center">
    <a href="https://www.swift.org" alt="Swift">
        <img src="https://img.shields.io/badge/Swift-5.8-orange.svg" />
    </a>
    <a href="./LICENSE" alt="License">
        <img src="https://img.shields.io/badge/Licence-MIT-green.svg" />
    </a>
    <a href="https://github.com/poviolabs/bunny-stream-ios/actions/workflows/BuildAndTest.yml" alt="Tests Status">
        <img src="https://github.com/poviolabs/bunny-stream-ios/actions/workflows/BuildAndTest.yml/badge.svg" />
    </a>
</p>

BunnyNet Stream SDK is a powerful and easy-to-use Swift Package Manager (SPM) package that provides Swift API client capabilities for the BunnyNet REST Stream API, along with a video player for smooth content playback.

## Architecture

### 1. Swift API Client for BunnyNet REST API

Generated directly from the BunnyNet OpenAPI specification using Apple's [swift-openapi-generator](https://github.com/apple/swift-openapi-generator). This ensures the SDK is always up-to-date with the latest API endpoints and definitions.

**Structure**:

- **Models**: Data structures representing BunnyNet Stream entities.
- **APIs**: Endpoints as Swift functions to interact with the BunnyNet Stream REST API.
- **Configuration**: Manage API keys, endpoints, and other configurations.

### 2. Video Uploader

A reliable video uploading solution leveraging the TUS protocol to ensure video uploads are resilient against network failures and can be paused, resumed, or canceled at any moment.

### 3. Video Player

A custom video player built to provide seamless streaming and playback of BunnyNet content.

## Installation

Add BunnyNet iOS SDK to your project:

```swift
dependencies: [
    .package(url: "https://github.com/poviolabs/bunny-stream-ios.git", .upToNextMajor(from: "1.0.0"))
]
```

## Getting Started

### 1. BunnyNetClient

In order to use the **BunnyNetClient**, it is just needed to import it and use all the endpoint specified in Stream API

```swift
import BunnyNetClient

let bunnyNetClient = BunnyNetClient(accessKey: "your_access_key")

// Example endpoint
let output = try await bunnyNetClient.streamAPI.Video_GetVideo(path: .init(libraryId: 312321, videoId: "dwaddaw-e9bb-4b96-dwdw-c17bc6a5292b"))
```

Find all the endpoints in [StreamAPI](https://docs.bunny.net/reference/api-overview)

### 2. BunnyNetVideoUploader

The `TUSVideoUploader` has a `make` function that provides a streamlined way to create an instance of the uploader.

To upload videos, you'll be using the `uploadVideos` method from the `VideoUploader` protocol.

#### Usage:

```swift
import BunnyNetVideoUploader


let videoUploader = TUSVideoUploader.make(accessKey: "your_access_key")

let videoInfo1 = VideoInfo(...) // Set up your VideoInfo here
let videoInfo2 = VideoInfo(...)

Task {
    do {
        try await videoUploader.uploadVideos(with: [videoInfo1, videoInfo2])
        print("Upload successful!")
    } catch {
        print("Error uploading videos: \(error)")
    }
}

```

#### Pause, Resume, and Remove Uploads

For these actions, you'll be using methods from the `VideoUploaderActions` protocol.

This ensures that when the background upload completes, or if there's an error, the `completionHandler` will be called. This will allow the app to update its UI or notify the user, among other possible actions.

In summary, the `TUSVideoUploader` provides an all-in-one solution for robust video uploading, supporting features like pausing, resuming, canceling, and background uploads.

```swift
do {
    try videoUploader.pauseUpload(for: specificUploadInfo)
    try videoUploader.resumeUpload(for: specificUploadInfo)
    try videoUploader.removeUpload(for: specificUploadInfo)
} catch {
    print("Error performing action: \(error)")
}
```

#### Background Mode

When the app goes into the background, especially during an upload, iOS might suspend it after a while. However, with background URL sessions, uploads can continue even when the app is in the background.

In your AppDelegate , when the `handleEventsForBackgroundURLSession` method is triggered, you can hand over the background session handling to the `videoUploader`.

```swift
func application(_ application: UIApplication,
                 handleEventsForBackgroundURLSession identifier: String,
                 completionHandler: @escaping () -> Void) {
    videoUploader.registerBackgroundHandler(completionHandler, forSession: identifier)
}

```

Checkout the [Example-App](./Example-App) for more details.

## License

BunnyNet iOS SDK is licensed under [MIT License](https://github.com/poviolabs/bunny-stream-ios/blob/feature/main/LICENSE).
