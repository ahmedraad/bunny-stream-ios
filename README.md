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

BunnyNet Stream SDK is a powerful and easy-to-use Swift Package Manager (SPM) package that provides Swift API client capabilities for the BunnyNet REST Stream API, a video player for smooth content playback, video uploader and live streaming.



## Packages

| Name                                                                 | Description                                                                                                                                                                           |
| -------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **[BunnyStreamSDK](Documentation/Reference/BunnyStreamSDK)**         | It allows you to upload, manage and process videos with a few lines of code.                                                                                                          |
| **[BunnyVideoUploader](Documentation/Reference/BunnyVideoUploader)** | A reliable video uploading solution leveraging the TUS protocol to ensure video uploads are resilient against network failures and can be paused, resumed, or canceled at any moment. |
| **[BunnyVideoPlayer](Documentation/Reference/BunnyVideoPlayer)**     | A custom video player built to provide seamless streaming and playback of BunnyNet content.                                                                                           |
| **[BunnyLiveStream](Documentation/Reference/BunnyLiveStream)**       | A live stream componentt built to provide seamless streaming.                                                                                                                         |



## Installation

Add BunnyNet iOS SDK to your project:

```swift
dependencies: [
    .package(url: "https://github.com/poviolabs/bunny-stream-ios.git", .upToNextMajor(from: "1.0.0"))
]
```



## Getting Started

### 1. BunnyStreamSDK

In order to use the **BunnyStreamSDK**, it is just needed to import it and use all the endpoint specified in Stream API

```swift
import BunnyStreamSDK

let bunnyStreamSDK = BunnyStreamSDK(accessKey: "your_access_key")

// Example endpoint
let output = try await bunnyStreamSDK.Api.Video_GetVideo(path: .init(libraryId: 312321, videoId: "dwaddaw-e9bb-4b96-dwdw-c17bc6a5292b"))
```

Find all the endpoints in [StreamAPI](https://docs.bunny.net/reference/api-overview)

### 2. BunnyVideoUploader

The `TUSVideoUploader` has a `make` function that provides a streamlined way to create an instance of the uploader.

To upload videos, you'll be using the `uploadVideos` method from the `VideoUploader` protocol.

#### Usage:

```swift
import BunnyVideoUploader


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

### 3. BunnyVideoPlayer

BunnyVideoPlayer is a component designed for seamless integration of video playback in your iOS applications. Customization can be done via the Bunny dashboard, and through the code, you can pass different icons for the player controls.

Usage
To use BunnyVideoPlayer in your SwiftUI project, follow these steps:

1. **Import BunnyVideoPlayer**: First, import the module into your SwiftUI view.

2. **Initialize BunnyVideoPlayer**: Create an instance of `BunnyVideoPlayer` with necessary parameters:

```swift
import BunnyVideoPlayer

BunnyVideoPlayer(
  accessKey: accessKey,
  videoId: videoId,
  libraryId: libraryId,
  cdn: cdnHostname
)
```

Parameters:

- `accessKey`: Your Bunny.net access key.

- `videoId`: The unique identifier for the video.

- `libraryId`: The ID of your Bunny.net video library.

- `cdnHostname`: The hostname of your Bunny.net CDN.



**Customizing Player:**

You can customize the BunnyVideoPlayer by passing custom icons. Other costumizations like primary color, font, handling control visibilty, captions, heatmap can be controlled from the BunnyNet dashboard.

```swift
extension BunnyVideoPlayer {
  static func make(videoId: String) -> BunnyVideoPlayer {
    let playerIcons = PlayerIcons(play: Image(systemName: "play.fill"))

    return BunnyVideoPlayer(
      accessKey: accessKey,
      videoId: videoId,
      libraryId: libraryId,
      cdn: cdnHostname,
      playerIcons: playerIcons
    )
  }
}

// Example view
struct VideoPlayerDemoView: View {
    var body: some View {
       BunnyVideoPlayer.make(videoId: videoInfo.id)
       .navigationBarTitle(Text("Video Player"), displayMode: .inline)
    }
}
```

### 4. BunnyLiveStream

We provide `BunnyLiveStreamView`, initialize a new instance by providing the necessary configurations such as the access key, and library ID. Below is an example showcasing how to integrate it within a SwiftUI view.

```swift
import BunnyLiveStream

struct VideoStreamDemoView: View {
  @State private var isStreamingPresented = false

  var body: some View {
    Group { }
      .fullScreenCover(isPresented: $isStreamingPresented,
                       content: {
        BunnyLiveStreamView(
          accessKey: "<access_key>",
          libraryId: <library_id>
        )
      })
  }
}
```

In this example, BunnyLiveStreamView is presented as a full-screen cover when isStreamingPresented is true. Replace <access_key>, and <library_id> with your specific stream's details.

Parameters:

- `accessKey:` The ID of the specific video you want to stream.

- `libraryId:` The ID of your video library.    

**Note:** Camera and Microphone permissions are needed, add `Privacy - Camera Usage Description` and `Privacy - Microphone Usage Description` to your Info.plist.

## License

BunnyNet iOS SDK is licensed under [MIT License](https://github.com/poviolabs/bunny-stream-ios/blob/feature/main/LICENSE).
