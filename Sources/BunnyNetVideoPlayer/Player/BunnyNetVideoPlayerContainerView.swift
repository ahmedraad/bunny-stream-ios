import SwiftUI

struct BunnyNetVideoPlayerContainerView: View {
  @Environment(\.videoPlayerTheme) var theme: VideoPlayerTheme
  @Environment(\.videoPlayerConfig) var videoPlayerConfig: VideoPlayerConfig
  @State var player: MediaPlayer
  @StateObject var controlsViewModel: VideoPlayerControlsViewModel
  @StateObject var videoPlayerViewModel: VideoPlayerViewModel
  private var adComponent: MediaPlayerAdComponent
  private let video: Video

  init(player: MediaPlayer, video: Video) {
    self.player = player
    self.video = video
    self._controlsViewModel = StateObject(wrappedValue: VideoPlayerControlsViewModel(player: player,
                                                                                     video: video,
                                                                                     heatmap: .init(data: [:], for: .zero)))
    self._videoPlayerViewModel = StateObject(wrappedValue: VideoPlayerViewModel())
    self.adComponent = MediaPlayerAdComponent(player: player)
  }
  
  public var body: some View {
#if os(iOS)
    videoPlayerView()
      .fullScreenCover(isPresented: $controlsViewModel.isFullScreen) {
        videoPlayerView()
          .background(Color.black.scaleEffect(controlsViewModel.isFullScreen ? 2 : 0))
      }
#elseif os(macOS)
    videoPlayerView()
      .sheet(isPresented: $controlsViewModel.isFullScreen) {
        videoPlayerView()
      }
#endif
  }
}

private extension BunnyNetVideoPlayerContainerView {
  func videoPlayerView() -> some View {
    VideoPlayerView(controlsViewModel: controlsViewModel,
                    viewModel: videoPlayerViewModel,
                    adComponent: adComponent,
                    video: video)
    .environment(\.videoPlayerTheme, theme)
    .environment(\.videoPlayerConfig, videoPlayerConfig)
  }
}
