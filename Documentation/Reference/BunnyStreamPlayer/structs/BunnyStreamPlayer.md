**STRUCT**

# `BunnyStreamPlayer`

```swift
public struct BunnyStreamPlayer: View
```

A SwiftUI view that provides an integrated video player experience
using BunnyStream.

`BunnyStreamPlayer` handles video loading, configuration, and playback.
It supports customizable themes and icons, as well as automatic
error handling and retry mechanisms.

## Properties
### `body`

```swift
public var body: some View
```

The main body of the `BunnyStreamPlayer`.

## Methods
### `init(accessKey:videoId:libraryId:cdn:playerIcons:)`

```swift
public init(accessKey: String,
     videoId: String,
     libraryId: Int,
     cdn: String,
     playerIcons: PlayerIcons? = nil)
```

Initializes a new instance of the `BunnyStreamPlayer`.

This initializer sets up the video player with the necessary configurations
such as access key, video ID, library ID, and CDN. Optionally, custom player
icons can be provided.

- Parameters:
  - accessKey: The access key for authentication.
  - videoId: The unique ID of the video to be played.
  - libraryId: The ID of the video library.
  - cdn: The URL of the content delivery network.
  - playerIcons: Optional custom icons for the video player.

### Usage Example:
```swift
struct VideoPlayerDemoView: View {
    var body: some View {
        BunnyStreamPlayer(accessKey: "your_access_key",
                         videoId: "your_video_id",
                         libraryId: 123,
                         cdn: "your_cdn")
        .navigationBarTitle(Text("Video Player"), displayMode: .inline)
    }
}
```

#### Parameters

| Name | Description |
| ---- | ----------- |
| accessKey | The access key for authentication. |
| videoId | The unique ID of the video to be played. |
| libraryId | The ID of the video library. |
| cdn | The URL of the content delivery network. |
| playerIcons | Optional custom icons for the video player. |