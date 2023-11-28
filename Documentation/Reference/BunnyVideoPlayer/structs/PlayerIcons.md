**STRUCT**

# `PlayerIcons`

```swift
public struct PlayerIcons
```

## Methods
### `init(play:pause:settings:volumeOn:volumeOff:fullscreenExpanded:fullscreenCollapsed:seekForward:seekBackward:playbackSpeed:quality:videoNotFound:reload:captions:)`

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
  captions: Image = Image(systemName: "captions.bubble")
)
```

`PlayerIcons` structure provides customizable image icons for video player controls.
It allows to specify different icons for various player functionalities,
enhancing the user interface and experience.

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
  - quality: Icon for adjusting video quality. Defaults to a system-provided playback speed icon.
  - videoNotFound: Icon displayed when a video is not found or unavailable. Defaults to a system-provided unavailable video icon.
  - reload: Icon for reloading the video. Defaults to a system-provided reload icon.
  - captions: Icon for toggling captions or subtitles. Defaults to a system-provided captions icon.

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
| quality | Icon for adjusting video quality. Defaults to a system-provided playback speed icon. |
| videoNotFound | Icon displayed when a video is not found or unavailable. Defaults to a system-provided unavailable video icon. |
| reload | Icon for reloading the video. Defaults to a system-provided reload icon. |
| captions | Icon for toggling captions or subtitles. Defaults to a system-provided captions icon. |