import SwiftUI
import AVKit
import Combine

struct VideoPlayerControls: View {
  @ObservedObject var viewModel: VideoPlayerViewModel
  
  init(player: MediaPlayer) {
    viewModel = VideoPlayerViewModel(player: player)
    player.delegate = viewModel
  }
  
  var body: some View {
    ZStack {
      VStack {
        topControlsView()
          .padding(.vertical, 4)
          .padding(.horizontal, 8)
        
        Spacer()
        
        centerControlsView()
        
        Spacer()
        
        bottomControlsView()
          .padding(.vertical, 4)
      }
    }
    .background(.black.opacity(0.2))
  }
}
 
// MARK: - Views
extension VideoPlayerControls {
  func topControlsView() -> some View {
    HStack {
      Spacer()
      fullScreenButton()
    }
  }
  
  func centerControlsView() -> some View {
    HStack {
      Spacer()
      
      Button(action: viewModel.skipBackward) {
        Image(systemName: "gobackward.10")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 30, height: 30)
          .foregroundColor(.white)
      }
      
      Spacer()
      
      Button(action: viewModel.togglePlayPause) {
        Image(systemName: viewModel.isPlaying ? "pause.fill" : "play.fill")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 40, height: 40)
          .foregroundColor(.white)
      }
      
      Spacer()
      
      Button(action: viewModel.skipForward) {
        Image(systemName: "goforward.10")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 30, height: 30)
          .foregroundColor(.white)
      }
      
      Spacer()
    }
  }
  
  func bottomControlsView() -> some View {
    VStack {
      seekBarView()
      
      HStack {
        timeView()
        Spacer()
        optionsButton()
        airplayButton()
        volumeButton()
      }
      .padding(.horizontal, 8)
    }
  }
  
  func fullScreenButton() -> some View {
    Button(action: viewModel.toggleFullScreenMode) {
      Image(systemName: viewModel.isFullScreen ? "arrow.down.forward.and.arrow.up.backward" : "arrow.up.left.and.arrow.down.right")
        .aspectRatio(contentMode: .fit)
        .frame(width: 30, height: 30)
        .foregroundColor(.white)
    }
  }
  
  func volumeButton() -> some View {
    Button(action: viewModel.toggleMute) {
      Image(systemName: viewModel.isMuted ? "speaker.slash.fill" : "speaker.wave.2.fill")
        .aspectRatio(contentMode: .fit)
        .frame(width: 30, height: 30)
        .foregroundColor(.white)
    }
  }
  
  func optionsButton() -> some View {
    Button(action: viewModel.optionsAction) {
      Image(systemName: "ellipsis.circle")
        .aspectRatio(contentMode: .fit)
        .frame(width: 30, height: 30)
        .foregroundColor(.white)
    }
  }
  
  func airplayButton() -> some View {
    Button(action: viewModel.airplayAction) {
      Image(systemName: "airplayvideo.circle")
        .aspectRatio(contentMode: .fit)
        .frame(width: 40, height: 40)
        .foregroundColor(.white)
    }
  }
  
  func seekBarView() -> some View {
    Slider(value: $viewModel.sliderValue, in: 0...1, onEditingChanged: { editing in
      if !editing {
        guard let duration = viewModel.player.currentItem?.duration.seconds else { return }
        let newTime = duration * viewModel.sliderValue
        let seekTime = CMTime(seconds: newTime, preferredTimescale: 1)
        viewModel.player.seek(to: seekTime)
      }
    })
    .onChange(of: viewModel.elapsedTime) { _ in
      guard viewModel.player.duration != .zero else { return }
      viewModel.sliderValue = viewModel.elapsedTime / viewModel.player.duration
    }
  }
  
  func timeView() -> some View {
    HStack(spacing: 0) {
      Text(viewModel.currentFormattedTime)
        .font(.caption)
        .foregroundColor(.white)
      
      Text(" / ")
        .font(.caption)
        .foregroundColor(.white)
      
      Text(viewModel.totalFormattedTime)
        .font(.caption)
        .foregroundColor(.white)
    }
  }

}
