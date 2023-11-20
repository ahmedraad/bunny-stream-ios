import Foundation
import SwiftUI

struct VideoPlayerTheme {
  var caption: Caption
  var font: Fonts
  var tintColor: Color
  var images: PlayerIcons
  
  struct Caption {
    var backgroundColor: Color
    var fontColor: Color
    var fontSize: CGFloat
    var image: Image
  }
}

// MARK: - Default theme
extension VideoPlayerTheme {
  static let defaultTheme = VideoPlayerTheme(
    caption: .init(backgroundColor: .black.opacity(0.7),
                   fontColor: .white,
                   fontSize: 13,
                   image: .init(systemName: "captions.bubble")),
    font: .system,
    tintColor: .accentColor,
    images: PlayerIcons()
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
      font: Fonts(rawValue: config.fontFamily) ?? VideoPlayerTheme.defaultTheme.font,
      tintColor: .init(hex: config.playerKeyColor) ?? VideoPlayerTheme.defaultTheme.tintColor,
      images: VideoPlayerTheme.defaultTheme.images
    )
  }
}
