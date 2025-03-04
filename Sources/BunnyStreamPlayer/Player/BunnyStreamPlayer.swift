import AVFoundation
import SwiftUI

/// A SwiftUI view that provides an integrated video player experience
/// using BunnyStream.
///
/// `BunnyStreamPlayer` handles video loading, configuration, and playback.
/// It supports customizable themes and icons, as well as automatic
/// error handling and retry mechanisms.
public struct BunnyStreamPlayer: View {

  /// The video configuration loader.
  let videoPlayerConfigLoader = VideoPlayerConfigLoader()
  /// The heatmap data loader.
  let heatmapLoader: HeatmapLoader
  /// The access key for authentication.
  let accessKey: String
  /// The unique ID of the video to be played.
  let videoId: String
  /// The ID of the video library.
  let libraryId: Int
  /// The URL of the content delivery network.
  let cdn: String

  /// The loading state of the video player.
  @State private var loadingState: VideoLoadingState = .loading
  /// The media player instance.
  @State var player: MediaPlayer?
  /// The theme configuration for the video player.
  @State var theme: VideoPlayerTheme = .defaultTheme
  /// The video player configuration.
  @State var videoConfig = VideoPlayerConfig()
  /// The set of custom player icons.
  internal var playerIcons: PlayerIcons?

  /// The different states of video loading.
  enum VideoLoadingState {
    /// Indicates that the video is currently loading.
    case loading
    /// Indicates that the video has loaded successfully with its metadata.
    case loaded(MediaPlayer, Video, Heatmap)
    /// Indicates that video loading has failed.
    case failed
    /// Indicates that loading has failed due to a specific error.
    case loaderFailed(VideoPlayerError)
  }

  /// The main body of the `BunnyStreamPlayer`.
  public var body: some View {
    VStack(alignment: .center) {
      switch loadingState {
      case .loading:
        ProgressView()
          .frame(maxWidth: .infinity, maxHeight: .infinity)
      case .loaded(let mediaPlayer, let video, let heatmap):
        BunnyStreamPlayerContainerView(player: mediaPlayer, video: video, heatmap: heatmap)
          .environment(\.videoPlayerTheme, theme)
          .environment(\.videoPlayerConfig, videoConfig)
          .onAppear {
            setupAudioSession()
            mediaPlayer.play()
          }
      case .failed:
        reloadButton()
      case .loaderFailed(let error):
        errorView(for: error)
      }
    }
    .task {
      await loadVideo()
    }
    .onDisappear {
      player?.pause()
    }
  }

  /// Loads the video and its configuration asynchronously.
  @MainActor
  func loadVideo() async {
    loadingState = .loading
    do {
      let videoConfigResponse = try await videoPlayerConfigLoader.load(libraryId: libraryId, videoId: videoId)
      var video = Video(videoConfigResponse: videoConfigResponse.video, cdn: cdn)
      let heatmap = try? await heatmapLoader.loadHeatmap(videoId: videoId, libraryId: libraryId, cdn: cdn)
      VideoPlayerConfig(response: videoConfigResponse).map { self.videoConfig = $0 }
      let player = MediaPlayer.make(video: video)
      self.player = player
      video.adjustLength(player.duration)
      self.theme = VideoPlayerTheme(config: videoConfigResponse) ?? theme
      if let playerIcons {
        self.theme.images = playerIcons
      }
      loadingState = .loaded(player, video, heatmap ?? Heatmap(data: [:]))
    } catch let error as VideoPlayerError {
      loadingState = .loaderFailed(error)
    } catch {
      loadingState = .failed
    }
  }

  /// Returns a reload button view for retrying video loading.
  private func reloadButton() -> some View {
    Button {
      Task { await loadVideo() }
    } label: {
      theme.images.reload
        .resizable()
        .scaledToFill()
        .frame(width: 40, height: 40)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }

  /// Returns an error view based on the specific `VideoPlayerError` encountered.
  private func errorView(for error: VideoPlayerError) -> some View {
    VStack(spacing: 8) {
      switch error {
      case .notFound:
        theme.images.videoNotFound
          .resizable()
          .scaledToFill()
          .frame(width: 40, height: 40)
        Text(Lingua.Player.videoNotFound)
          .font(theme.font.size(11))
      case .audioError:
        Text(Lingua.Error.audioError)
          .font(theme.font.size(13))
        reloadButton()
      default:
        reloadButton()
      }
    }
  }

  /// Configures the audio session for video playback.
  private func setupAudioSession() {
#if os(iOS)
    do {
      let session = AVAudioSession.sharedInstance()
      try session.setCategory(.playback, mode: .moviePlayback, options: [])
      try session.setActive(true)
    } catch {
      player?.stop()
      loadingState = .loaderFailed(.audioError)
    }
#endif
  }
}

public extension BunnyStreamPlayer {
  /// Initializes a new instance of the `BunnyStreamPlayer`.
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
  /// ### Usage Example:
  /// ```swift
  /// struct VideoPlayerDemoView: View {
  ///     var body: some View {
  ///         BunnyStreamPlayer(accessKey: "your_access_key",
  ///                          videoId: "your_video_id",
  ///                          libraryId: 123,
  ///                          cdn: "your_cdn")
  ///         .navigationBarTitle(Text("Video Player"), displayMode: .inline)
  ///     }
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
