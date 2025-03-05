**STRUCT**

# `PlayerIcons`

```swift
public struct PlayerIcons
```

A structure that provides customizable image icons for video player controls.

`PlayerIcons` allows developers to specify different icons for various player functionalities,
enhancing the user interface and user experience.

## Properties
### `play`

```swift
public var play: Image
```

Icon for the play action.

### `pause`

```swift
public var pause: Image
```

Icon for the pause action.

### `settings`

```swift
public var settings: Image
```

Icon for accessing settings.

### `volumeOn`

```swift
public var volumeOn: Image
```

Icon indicating the volume is on.

### `volumeOff`

```swift
public var volumeOff: Image
```

Icon indicating the volume is off or muted.

### `fullscreenExpanded`

```swift
public var fullscreenExpanded: Image
```

Icon for expanding the video to fullscreen mode.

### `fullscreenCollapsed`

```swift
public var fullscreenCollapsed: Image
```

Icon for exiting fullscreen mode.

### `seekForward`

```swift
public var seekForward: Image
```

Icon for seeking the video forward.

### `seekBackward`

```swift
public var seekBackward: Image
```

Icon for seeking the video backward.

### `playbackSpeed`

```swift
public var playbackSpeed: Image
```

Icon for adjusting playback speed.

### `quality`

```swift
public var quality: Image
```

Icon for adjusting video quality.

### `videoNotFound`

```swift
public var videoNotFound: Image
```

Icon displayed when a video is not found or unavailable.

### `reload`

```swift
public var reload: Image
```

Icon for reloading the video.

### `captions`

```swift
public var captions: Image
```

Icon for toggling captions or subtitles.

### `captionsEnabled`

```swift
public var captionsEnabled: Image
```

Icon indicating captions or subtitles are enabled.

## Methods
### `init(play:pause:settings:volumeOn:volumeOff:fullscreenExpanded:fullscreenCollapsed:seekForward:seekBackward:playbackSpeed:quality:videoNotFound:reload:captions:captionsEnabled:)`

```swift
public init(
  play: Image = Image(systemName: "play.fill"),
  pause: Image = Image(systemName: "pause.fill"),
  settings: Image = Image(systemName: "ellipsis.circle"),
  volumeOn: Image = Image(systemName: "speaker.wave.2.fill"),
  volumeOff: Image = Image(systemName: "speaker.slash.fill"),
  fullscreenExpanded: Image = Image(systemName: "arrow.down.forward.and.arrow.up.backward"),
  fullscreenCollapsed: Image = Image(systemName: "arrow.up.left.and.arrow.down.right"),
  seekForward: Image = Image(systemName: "goforward.10"),
  seekBackward: Image = Image(systemName: "gobackward.10"),
  playbackSpeed: Image = Image(systemName: "timer"),
  quality: Image = Image(systemName: "4k.tv"),
  videoNotFound: Image = Image(systemName: "play.slash.fill"),
  reload: Image = Image(systemName: "arrow.counterclockwise.circle"),
  captions: Image = Image(systemName: "captions.bubble"),
  captionsEnabled: Image = Image(systemName: "captions.bubble.fill")
)
```

Initializes a new `PlayerIcons` instance with customizable icons for video player controls.

- Parameters:
  - play: Icon for the play action. Defaults to a system-provided play icon.
  - pause: Icon for the pause action. Defaults to a system-provided pause icon.
  - settings: Icon for accessing settings. Defaults to a system-provided settings icon.
  - volumeOn: Icon indicating the volume is on. Defaults to a system-provided volume on icon.
  - volumeOff: Icon indicating the volume is off or muted. Defaults to a system-provided volume off icon.
  - fullscreenExpanded: Icon for expanding the video to fullscreen mode. Defaults to a system-provided fullscreen expand icon.
  - fullscreenCollapsed: Icon for exiting fullscreen mode. Defaults to a system-provided fullscreen collapse icon.
  - seekForward: Icon for seeking the video forward. Defaults to a system-provided seek forward icon.
  - seekBackward: Icon for seeking the video backward. Defaults to a system-provided seek backward icon.
  - playbackSpeed: Icon for adjusting playback speed. Defaults to a system-provided playback speed icon.
  - quality: Icon for adjusting video quality. Defaults to a system-provided 4K TV icon.
  - videoNotFound: Icon displayed when a video is not found or unavailable. Defaults to a system-provided unavailable video icon.
  - reload: Icon for reloading the video. Defaults to a system-provided reload icon.
  - captions: Icon for toggling captions or subtitles. Defaults to a system-provided captions icon.
  - captionsEnabled: Icon indicating captions or subtitles are enabled. Defaults to a system-provided captions enabled icon.

#### Parameters

| Name | Description |
| ---- | ----------- |
| play | Icon for the play action. Defaults to a system-provided play icon. |
| pause | Icon for the pause action. Defaults to a system-provided pause icon. |
| settings | Icon for accessing settings. Defaults to a system-provided settings icon. |
| volumeOn | Icon indicating the volume is on. Defaults to a system-provided volume on icon. |
| volumeOff | Icon indicating the volume is off or muted. Defaults to a system-provided volume off icon. |
| fullscreenExpanded | Icon for expanding the video to fullscreen mode. Defaults to a system-provided fullscreen expand icon. |
| fullscreenCollapsed | Icon for exiting fullscreen mode. Defaults to a system-provided fullscreen collapse icon. |
| seekForward | Icon for seeking the video forward. Defaults to a system-provided seek forward icon. |
| seekBackward | Icon for seeking the video backward. Defaults to a system-provided seek backward icon. |
| playbackSpeed | Icon for adjusting playback speed. Defaults to a system-provided playback speed icon. |
| quality | Icon for adjusting video quality. Defaults to a system-provided 4K TV icon. |
| videoNotFound | Icon displayed when a video is not found or unavailable. Defaults to a system-provided unavailable video icon. |
| reload | Icon for reloading the video. Defaults to a system-provided reload icon. |
| captions | Icon for toggling captions or subtitles. Defaults to a system-provided captions icon. |
| captionsEnabled | Icon indicating captions or subtitles are enabled. Defaults to a system-provided captions enabled icon. |