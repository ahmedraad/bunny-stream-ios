import AVFoundation
import SwiftUI

public extension BunnyStreamPlayer {
  /// Initializes a new instance of the BunnyStreamPlayer.
  ///
  /// This initializer sets up the video player with the necessary configurations
  /// such as access key, video ID, library ID, and CDN. Optionally, custom player
  /// icons can be provided.
  ///
  /// - Parameters:
  ///   - accessKey: The access key for authentication.
  ///   - videoId: The unique ID of the video to be played.
  ///   - libraryId: The ID of the video library.
  ///   - cdn: The URL of the content delivery network.
  ///   - playerIcons: Optional custom icons for the video player.
  ///
  /// Usage Example:
  /// ```
  /// struct VideoPlayerDemoView: View {
  ///  var body: some View {
  ///   BunnyStreamPlayer(accessKey: "your_access_key",
  ///                    videoId: "your_video_id",
  ///                    libraryId: 123,
  ///                    cdn: "your_cdn")
  ///   .navigationBarTitle(Text("Video Player"), displayMode: .inline)
  ///  }
  /// }
  /// ```
  init(accessKey: String,
       videoId: String,
       libraryId: Int,
       cdn: String,
       playerIcons: PlayerIcons? = nil) {
    self.accessKey = accessKey
    self.videoId = videoId
    self.libraryId = libraryId
    self.cdn = cdn
    self.heatmapLoader = HeatmapLoader(bunnyStreamSDK: .init(accessKey: accessKey))
    if let playerIcons {
      self.playerIcons = playerIcons
      self.theme.images = playerIcons
    }
    FontManager.registerFonts()
  }
}
