import SwiftUI
import AVKit

struct VideoPlayerView: View {
  @State var controlsViewModel: VideoPlayerControlsViewModel
  
  init(controlsViewModel: VideoPlayerControlsViewModel) {
    self.controlsViewModel = controlsViewModel
  }
  
  var body: some View {
    VideoPlayer(player: controlsViewModel.player)
      .disabled(true)
      .overlay {
        VideoPlayerControls(viewModel: controlsViewModel)
      }
      .background(controlsViewModel.isFullScreen ? .black : .clear)
  }
}
