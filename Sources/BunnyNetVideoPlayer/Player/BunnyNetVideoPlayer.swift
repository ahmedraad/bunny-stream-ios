import SwiftUI

public struct BunnyNetVideoPlayer: View {
  let videoPlayerConfigLoader = VideoPlayerConfigLoader()
  let videoLoader: VideoLoader
  let accessKey: String
  let videoId: String
  let libraryId: Int
  let cdn: String
  @State var player: MediaPlayer?
  @State private var loadingState: VideoLoadingState = .loading
  @State var theme: VideoPlayerTheme = .defaultTheme
  @State var videoConfig = VideoPlayerConfig()
  
  enum VideoLoadingState {
    case loading, loaded(MediaPlayer, Video), failed, loaderFailed(VideoLoader.VideoLoaderError)
  }
  
  public init(accessKey: String,
              videoId: String,
              libraryId: Int,
              cdn: String) {
    self.accessKey = accessKey
    self.videoId = videoId
    self.libraryId = libraryId
    self.cdn = cdn
    videoLoader = VideoLoader(bunnyNetClient: .init(accessKey: accessKey))
    FontManager.registerFonts()
  }
  
  public var body: some View {
    VStack(alignment: .center) {
      switch loadingState {
      case .loading:
        ProgressView()
          .frame(maxWidth: .infinity, maxHeight: .infinity)
      case .loaded(let mediaPlayer, let video):
        BunnyNetVideoPlayerContainerView(player: mediaPlayer, video: video)
          .environment(\.videoPlayerTheme, theme)
          .environment(\.videoPlayerConfig, videoConfig)
      case .failed:
        reloadButton()
      case .loaderFailed(let error):
        switch error {
        case .notFound:
          VStack(spacing: 8) {
            theme.images.videoNotFound
              .resizable()
              .scaledToFill()
              .frame(width: 40, height: 40)
            Text(Lingua.Player.videoNotFound)
              .font(theme.font.size(11))
          }
        case .loadError:
          reloadButton()
        }
      }
    }
    .task {
      await loadVideo()
    }
    .onDisappear {
      player?.pause()
    }
  }
  
  @MainActor
  func loadVideo() async {
    loadingState = .loading
    do {
      let video = try await videoLoader.loadVideo(videoId: videoId, libraryId: libraryId, cdn: cdn)
      let videoConfigResponse = try? await videoPlayerConfigLoader.load(libraryId: libraryId)
      VideoPlayerConfig(response: videoConfigResponse).map { self.videoConfig = $0 }
      let player = MediaPlayer.make(video: video)
      self.player = player
      self.theme = VideoPlayerTheme(config: videoConfigResponse) ?? VideoPlayerTheme.defaultTheme
      loadingState = .loaded(player, video)
    } catch let error as VideoLoader.VideoLoaderError {
      loadingState = .loaderFailed(error)
    } catch {
      loadingState = .failed
    }
  }
}

private extension BunnyNetVideoPlayer {
  func reloadButton() -> some View {
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
}
