import Foundation

extension MediaPlayer {
  /// Creates a `MediaPlayer` instance configured with the specified video and FairPlay details.
  ///
  /// This factory method attempts to create a URL using the given `videoId` and `cdn`. If successful, it initializes
  /// a `FairPlayStreamHandler` with the `videoId` and `libraryId`, sets up the `MediaPlayer`, and associates the `FairPlayStreamHandler`
  /// with the `MediaPlayer`. If any step of the process fails, it returns `nil`.
  ///
  /// - Parameters:
  ///   - video: A `Video`  for the video to be played.
  ///
  /// - Returns: An optional `MediaPlayer` instance. If the URL cannot be constructed or any other
  ///   initialization step fails, the result is `nil`.
  ///
  /// Example Usage:
  /// ```
  /// let player = MediaPlayer.make(video: video)
  /// ```
  static func make(video: Video) -> MediaPlayer {
    let url = URL(string: "https://\(video.cdn)/\(video.guid)/playlist.m3u8")!
    let fairPlayHandler = FairPlayStreamHandler(videoId: video.guid, libraryId: video.libraryId)
    let subtitlesProvider = MediaPlayerSubtitlesProvider(video: video)
    let mediaPlayer = MediaPlayer(url: url,
                                  fairPlayHandler: fairPlayHandler,
                                  subtitlesProvider: subtitlesProvider)
    
    Task { try? await subtitlesProvider.loadSubtitles() }
    
    return mediaPlayer
  }
}
