import SwiftUI
import AVKit

struct VideoPlayerView: View {
  @ObservedObject var controlsViewModel: VideoPlayerControlsViewModel
  @ObservedObject var viewModel: VideoPlayerViewModel

  init(controlsViewModel: VideoPlayerControlsViewModel,
       viewModel: VideoPlayerViewModel) {
    self.controlsViewModel = controlsViewModel
    self.viewModel = viewModel
  }

  var body: some View {
    VStack {
      AVPlayerViewControllerRepresentable(player: controlsViewModel.player)
        .overlay {
          ZStack {
            VStack {
              Spacer()
              CaptionsView(captions: controlsViewModel.captions, backgroundColor: .black.opacity(0.6), fontColor: .white, fontSize: 15)
                .padding(.bottom, viewModel.isVisible ? 50 : 0)
            }
            VideoPlayerControls(viewModel: controlsViewModel)
              .opacity(viewModel.isVisible ? 1 : 0)
              .background(Color.black.opacity(viewModel.isVisible ? 0.3 : 0.001))
          }
        }
        .onTapGesture {
          viewModel.toggleControlsVisibility()
        }
        .onChange(of: controlsViewModel.isPlaying, perform: viewModel.isPlayingChange)
        .onChange(of: controlsViewModel.isMuted, perform: viewModel.resetControlsHideTimer)
        .onChange(of: controlsViewModel.isDraggingSeekBar, perform: viewModel.isDraggingSeekBarChange)
        .onChange(of: controlsViewModel.isFullScreen, perform: viewModel.resetControlsHideTimer)
        .onChange(of: controlsViewModel.playbackState, perform: viewModel.playBackStateChange)
        .onChange(of: controlsViewModel.isOptionsMenuActive, perform: viewModel.isPlayingChange)
        .onAppear {
          viewModel.resetControlsHideTimer()
        }
    }
  }
}
