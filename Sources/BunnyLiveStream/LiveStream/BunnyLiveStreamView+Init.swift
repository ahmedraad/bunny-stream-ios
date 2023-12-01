import Foundation

public extension BunnyLiveStreamView {
  /// Initializes a new instance of the BunnyLiveStreamView.
  ///
  /// This initializer sets up the video stream view with the necessary configurations
  /// such as access key, video ID, library ID
  ///
  /// - Parameters:
  ///   - accessKey: The access key for authentication.
  ///   - videoId: The unique ID of the video to be played.
  ///   - libraryId: The ID of the video library.
  ///
  /// Usage Example:
  /// ```
  /// struct VideoStreamDemoView: View {
  ///  var body: some View {
  ///    Group { }
  ///     .fullScreenCover(isPresented: $isStreamingPresented,
  ///                      content: {
  ///      BunnyLiveStreamView(
  ///       videoId: "<video_id>",
  ///       accessKey: "<access_key>",
  ///       libraryId: <library_id>
  ///      )
  ///   })
  ///  }
  /// }
  /// ```
  init(
    videoId: String,
    accessKey: String,
    libraryId: Int
  ) {
    let config = StreamConfig(videoId: videoId, accessKey: accessKey, libraryId: libraryId)
    let streamViewModel = BunnyLiveStreamViewModel(streamConfig: config)
    self.init(streamViewModel: streamViewModel)
  }
}
