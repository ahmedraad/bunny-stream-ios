import SwiftUI

public struct BunnyNetVideoPlayer: View {
  @State public var player: MediaPlayer
  @StateObject var controlsViewModel: VideoPlayerControlsViewModel
  @StateObject var videoPlayerViewModel: VideoPlayerViewModel

  public init(player: MediaPlayer) {
    self.player = player
    self._controlsViewModel = StateObject(wrappedValue: VideoPlayerControlsViewModel(player: player))
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
