import Foundation

public extension MediaPlayer {
  /// Creates a `MediaPlayer` instance configured with the specified video and FairPlay details.
  ///
  /// This factory method attempts to create a URL using the given `videoId` and `cdn`. If successful, it initializes
  /// a `FairPlayStreamHandler` with the `videoId` and `libraryId`, sets up the `MediaPlayer`, and associates the `FairPlayStreamHandler`
  /// with the `MediaPlayer`. If any step of the process fails, it returns `nil`.
  ///
  /// - Parameters:
  ///   - videoId: A `String` identifier for the video to be played.
  ///   - libraryId: An `Int` identifying the library that the video belongs to.
  ///   - cdn: A `String` representing the base URL of the content delivery network.
  ///
  /// - Returns: An optional `MediaPlayer` instance. If the URL cannot be constructed or any other
  ///   initialization step fails, the result is `nil`.
  ///
  /// Example Usage:
  /// ```
  /// let player = MediaPlayer.make(videoId: "example_video", libraryId: 123, cdn: "cdn.example.com")
  /// ```
  static func make(videoId: String, libraryId: Int, cdn: String) -> MediaPlayer {
    let url = URL(string: "https://\(cdn)/\(videoId)/playlist.m3u8")!
    let fairPlayHandler = FairPlayStreamHandler(videoId: videoId, libraryId: libraryId)
    let mediaPlayer = MediaPlayer(url: url, fairPlayHandler: fairPlayHandler)
    
    return mediaPlayer
  }
}
