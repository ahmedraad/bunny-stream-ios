import SwiftUI
import AVKit
import Combine

struct VideoPlayerControls: View {
  @ObservedObject private var viewModel: VideoPlayerControlsViewModel
  @State private var airPlayView = AirPlayView()

  init(viewModel: VideoPlayerControlsViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    ZStack {
      VStack {
        topControlsView()
          .padding(.vertical, 4)
          .padding(.horizontal, 8)
          .opacity(viewModel.isDraggingSeekBar ? 0 : 1)
        
        Spacer()
        
        centerControlsView()
          .opacity(viewModel.isDraggingSeekBar ? 0 : 1)
        
        Spacer()
        
        bottomControlsView()
      }
    }
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
  
  @ViewBuilder
  func optionsButton() -> some View {
    Menu {
      PlaybackSpeedView(viewModel: viewModel.playbackSpeedViewModel)
    } label: {
      Image(systemName: "ellipsis.circle")
        .aspectRatio(contentMode: .fit)
        .frame(width: 30, height: 30)
        .foregroundColor(.white)
    }
    .contentShape(Rectangle())
    .simultaneousGesture(TapGesture().onEnded {
      viewModel.isOptionsMenuActive = true
    })
  }
  
  func airplayButton() -> some View {
    Button(action: {
      airPlayView.showAirPlayMenu()
    }) {
      airPlayView
    }
    .buttonStyle(PlainButtonStyle())
    .frame(width: 40, height: 40)
  }
  
  func seekBarView() -> some View {
    SeekBarView(viewModel: viewModel.seekBarViewModel, isDraggingOutside: $viewModel.isDraggingSeekBar)
      .padding(.bottom, -16)
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
