import Foundation

public extension BunnyLiveStreamView {
  /// Initializes a new instance of the BunnyLiveStreamView.
  ///
  /// This initializer sets up the video stream view with the necessary configurations
  /// such as access key,  library ID
  ///
  /// - Parameters:
  ///   - accessKey: The access key for authentication.
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
  ///       accessKey: "<access_key>",
  ///       libraryId: <library_id>
  ///      )
  ///   })
  ///  }
  /// }
  /// ```
  init(
    accessKey: String,
    libraryId: Int
  ) {
    let config = StreamConfig(accessKey: accessKey, libraryId: libraryId)
    let videoCreator = VideoCreator(bunnyStreamSDK: .init(accessKey: accessKey), libraryId: libraryId)
    let streamViewModel = BunnyLiveStreamViewModel(streamConfig: config, videoCreator: videoCreator)
    self.init(streamViewModel: streamViewModel)
  }
}
