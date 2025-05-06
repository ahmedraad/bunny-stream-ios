# BunnyStreamPlayer

[![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)](https://www.swift.org)
[![License](https://img.shields.io/badge/Licence-MIT-green.svg)](LICENSE)

## Overview

BunnyStreamPlayer is a feature-rich video player specifically optimized for Bunny's CDN. It provides smooth playback with adaptive bitrate streaming and a fully customizable interface built with SwiftUI.

### Features

- Adaptive bitrate streaming
- Custom controls and UI elements
- Multiple video format support
- Multiple audio tracks support
- Bunny CDN integration
- AirPlay support
- Customizable player appearance
- Caption support
- Heatmap integration

### Requirements

- iOS 15.0+ / macOS 13.0+
- Swift 5.9+
- Xcode 13.0+

### Customization

The player supports various customization options via BunnyStream's dashboard:
- Custom player icons
- Primary color theming
- Font customization
- Control visibility
- Caption settings
- Heatmap visualization

### Usage example

To integrate BunnyStreamPlayer into your SwiftUI view, simply instantiate it as shown below:

```swift
import BunnyStreamPlayer

BunnyStreamPlayer(
  accessKey: accessKey,
  videoId: videoId,
  libraryId: libraryId,
  cdn: cdnHostname
)
```

**Customizing Player:**

You can customize the BunnyStreamPlayer by passing custom icons. Other costumizations like primary color, font, handling control visibilty, captions, heatmap can be controlled from the Bunny dashboard.

```swift
extension BunnyStreamPlayer {
  static func make(videoId: String) -> BunnyStreamPlayer {
    let playerIcons = PlayerIcons(play: Image(systemName: "play.fill"))

    return BunnyStreamPlayer(
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
       BunnyStreamPlayer.make(videoId: videoInfo.id)
       .navigationBarTitle(Text("Video Player"), displayMode: .inline)
    }
}
```

---

# Reference Documentation

## Structs
-   [BunnyStreamPlayer](structs/BunnyStreamPlayer.md)
-   [PlayerIcons](structs/PlayerIcons.md)
-   [VideoPlayerConfigLoader](structs/VideoPlayerConfigLoader.md)

Copyright (c) 2019 BunnyWay d.o.o.
