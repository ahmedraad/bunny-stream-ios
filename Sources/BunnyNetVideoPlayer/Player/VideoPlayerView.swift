import SwiftUI
import AVKit

struct VideoPlayerView: View {
  @State var controlsViewModel: VideoPlayerControlsViewModel

  init(controlsViewModel: VideoPlayerControlsViewModel) {
    self.controlsViewModel = controlsViewModel
  }

  var body: some View {
    VStack {
      AVPlayerViewControllerRepresentable(player: controlsViewModel.player)
        .overlay {
          VideoPlayerControls(viewModel: controlsViewModel)
        }
        .background(controlsViewModel.isFullScreen ? Color.black : Color.clear)
    }
  }
}
