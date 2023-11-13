import SwiftUI

struct BunnyNetVideoPlayerContainerView: View {
  @State var player: MediaPlayer
  @StateObject var controlsViewModel: VideoPlayerControlsViewModel
  @StateObject var videoPlayerViewModel: VideoPlayerViewModel
  
  init(player: MediaPlayer, video: Video) {
    self.player = player
    self._controlsViewModel = StateObject(wrappedValue: VideoPlayerControlsViewModel(player: player,
                                                                                     video: video,
                                                                                     heatmap: .init(data: [:], for: .zero)))
    self._videoPlayerViewModel = StateObject(wrappedValue: VideoPlayerViewModel())
  }
  
  public var body: some View {
#if os(iOS)
    VideoPlayerView(controlsViewModel: controlsViewModel, viewModel: videoPlayerViewModel)
      .fullScreenCover(isPresented: $controlsViewModel.isFullScreen) {
        VideoPlayerView(controlsViewModel: controlsViewModel, viewModel: videoPlayerViewModel)
          .background(Color.black.scaleEffect(controlsViewModel.isFullScreen ? 2 : 0))
      }
#elseif os(macOS)
    VideoPlayerView(controlsViewModel: controlsViewModel, viewModel: videoPlayerViewModel)
      .sheet(isPresented: $controlsViewModel.isFullScreen) {
        VideoPlayerView(controlsViewModel: controlsViewModel, viewModel: videoPlayerViewModel)
      }
#endif
  }
}
