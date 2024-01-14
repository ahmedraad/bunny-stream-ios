import SwiftUI

struct VideoPlayerThemeKey: EnvironmentKey {
  static let defaultValue = VideoPlayerTheme.defaultTheme
}

struct VideoPlayerConfigKey: EnvironmentKey {
  static let defaultValue = VideoPlayerConfig()
}

extension EnvironmentValues {
  var videoPlayerTheme: VideoPlayerTheme {
    get { self[VideoPlayerThemeKey.self] }
    set { self[VideoPlayerThemeKey.self] = newValue }
  }
  
  var videoPlayerConfig: VideoPlayerConfig {
    get { self[VideoPlayerConfigKey.self] }
    set { self[VideoPlayerConfigKey.self] = newValue }
  }
}
