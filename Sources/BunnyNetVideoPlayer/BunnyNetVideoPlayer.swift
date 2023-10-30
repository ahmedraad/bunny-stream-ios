import SwiftUI

public struct BunnyNetVideoPlayer: View {
  @State public var player: MediaPlayer
  @StateObject var controlsViewModel: VideoPlayerControlsViewModel

  public init(player: MediaPlayer) {
    self.player = player
    self._controlsViewModel = StateObject(wrappedValue: VideoPlayerControlsViewModel(player: player))
  }
  
  public var body: some View {
#if os(iOS)
    VideoPlayerView(controlsViewModel: controlsViewModel)
      .fullScreenCover(isPresented: $controlsViewModel.isFullScreen) {
        VideoPlayerView(controlsViewModel: controlsViewModel)
          .background(Color.black.scaleEffect(controlsViewModel.isFullScreen ? 2 : 0))
      }
#elseif os(macOS)
    VideoPlayerView(controlsViewModel: controlsViewModel)
      .sheet(isPresented: $controlsViewModel.isFullScreen) {
        VideoPlayerView(controlsViewModel: controlsViewModel)
      }
#endif
  }
}
