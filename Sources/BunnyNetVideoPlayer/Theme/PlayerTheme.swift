import Foundation
import SwiftUI

struct VideoPlayerTheme {
  var caption: Caption
  var font: Font
  var tintColor: Color
  var images: Images
  
  struct Caption {
    var backgroundColor: Color
    var fontColor: Color
    var fontSize: CGFloat
    var image: Image
  }
  
  struct Images {
    var play: Image
    var pause: Image
    var settings: Image
    var volumeOn: Image
    var volumeOff: Image
    var fullscreenExpanded: Image
    var fullscreenCollapsed: Image
    var seekForward: Image
    var seekBackward: Image
    var playbackSpeed: Image
    var videoNotFound: Image
    var reload: Image
    var captions: Image
  }
}

// MARK: - Default theme
extension VideoPlayerTheme {
  static let defaultTheme = VideoPlayerTheme(
    caption: .init(backgroundColor: .black.opacity(0.7),
                   fontColor: .white,
                   fontSize: 13,
                   image: .init(systemName: "captions.bubble")),
    font: Font.system(size: 14),
    tintColor: .accentColor,
    images: VideoPlayerTheme.Images(play: Image(systemName: "play.fill"),
                                    pause: Image(systemName: "pause.fill"),
                                    settings: Image(systemName: "ellipsis.circle"),
                                    volumeOn: Image(systemName: "speaker.wave.2.fill"),
                                    volumeOff: Image(systemName: "speaker.slash.fill"),
                                    fullscreenExpanded: Image(systemName: "arrow.down.forward.and.arrow.up.backward"),
                                    fullscreenCollapsed: Image(systemName: "arrow.up.left.and.arrow.down.right"),
                                    seekForward: Image(systemName: "goforward.10"),
                                    seekBackward: Image(systemName: "gobackward.10"),
                                    playbackSpeed: Image(systemName: "timer"), 
                                    videoNotFound: Image(systemName: "play.slash.fill"),
                                    reload: Image(systemName: "arrow.counterclockwise.circle"),
                                    captions: Image(systemName: "captions.bubble"))
  )
}

// MARK: - VideoConfig
extension VideoPlayerTheme {
  init?(config: VideoConfigResponse?) {
    guard let config else { return nil }
    self.init(
      caption: VideoPlayerTheme.Caption(
        backgroundColor: .init(hex: config.captionsBackground) ?? VideoPlayerTheme.defaultTheme.caption.backgroundColor,
        fontColor: .init(hex: config.captionsFontColor) ?? VideoPlayerTheme.defaultTheme.caption.fontColor,
        fontSize: CGFloat(config.captionsFontSize),
        image: VideoPlayerTheme.defaultTheme.caption.image
      ),
      font: VideoPlayerTheme.defaultTheme.font,
      tintColor: .init(hex: config.playerKeyColor) ?? VideoPlayerTheme.defaultTheme.tintColor,
      images: VideoPlayerTheme.defaultTheme.images
    )
  }
}
