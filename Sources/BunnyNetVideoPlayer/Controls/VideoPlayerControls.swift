import SwiftUI
import AVKit
import Combine

struct VideoPlayerControls: View {
  @Environment(\.videoPlayerTheme) var theme: VideoPlayerTheme
  @Environment(\.videoPlayerConfig) var videoPlayerConfig: VideoPlayerConfig
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
        .shouldAddView(controlsToCheck: .fullScreen, in: videoPlayerConfig.controls)
    }
  }
  
  func centerControlsView() -> some View {
    HStack {
      Spacer()
      
      Button(action: viewModel.skipBackward) {
        theme.images.seekBackward
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 30, height: 30)
          .foregroundColor(.white)
      }
      .shouldAddView(controlsToCheck: .rewind, in: videoPlayerConfig.controls)
      
      Spacer()
      
      Button(action: viewModel.togglePlayPause) {
        (viewModel.isPlaying ? theme.images.pause : theme.images.play)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 40, height: 40)
          .foregroundColor(.white)
      }
      .shouldAddView(controlsToCheck: .play, in: videoPlayerConfig.controls)
      
      Spacer()
      
      Button(action: viewModel.skipForward) {
        theme.images.seekForward
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 30, height: 30)
          .foregroundColor(.white)
      }
      .shouldAddView(controlsToCheck: .fastForward, in: videoPlayerConfig.controls)
      
      Spacer()
    }
  }
  
  func bottomControlsView() -> some View {
    VStack {
      seekBarView()
        .shouldAddView(controlsToCheck: .progress, in: videoPlayerConfig.controls)
      
      HStack {
        timeView()
        Spacer()
        optionsButton()
          .shouldAddView(controlsToCheck: .settings, in: videoPlayerConfig.controls)
        airplayButton()
        volumeButton()
          .shouldAddView(controlsToCheck: .mute, in: videoPlayerConfig.controls)
      }
      .padding(.horizontal, 8)
    }
  }
  
  func fullScreenButton() -> some View {
    Button(action: viewModel.toggleFullScreenMode) {
      (viewModel.isFullScreen ? theme.images.fullscreenExpanded : theme.images.fullscreenCollapsed)
        .aspectRatio(contentMode: .fit)
        .frame(width: 30, height: 30)
        .foregroundColor(.white)
    }
  }
  
  func volumeButton() -> some View {
    Button(action: viewModel.toggleMute) {
      (viewModel.isMuted ? theme.images.volumeOff : theme.images.volumeOn)
        .aspectRatio(contentMode: .fit)
        .frame(width: 30, height: 30)
        .foregroundColor(.white)
    }
  }
  
  @ViewBuilder
  func optionsButton() -> some View {
    Menu {
      PlaybackSpeedView(viewModel: viewModel.playbackSpeedViewModel)
        .environment(\.videoPlayerTheme, theme)
      CaptionsMenuView(viewModel: viewModel.captionsMenuViewModel)
        .shouldAddView(!viewModel.captionsMenuViewModel.captions.isEmpty)
        .shouldAddView(controlsToCheck: .captions, in: videoPlayerConfig.controls)
        .environment(\.videoPlayerTheme, theme)
    } label: {
      theme.images.settings
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
      .environment(\.videoPlayerConfig, videoPlayerConfig)
      .padding(.bottom, -16)
  }
  
  func timeView() -> some View {
    HStack(spacing: 0) {
      Text(viewModel.currentFormattedTime)
        .font(theme.font.size(11))
        .foregroundColor(.white)
        .shouldAddView(controlsToCheck: .currentTime, in: videoPlayerConfig.controls)
      
      Text(" / ")
        .font(.caption)
        .foregroundColor(.white)
        .shouldAddView(controlsToCheck: .captions, .duration, in: videoPlayerConfig.controls)
      
      Text(viewModel.totalFormattedTime)
        .font(theme.font.size(11))
        .foregroundColor(.white)
        .shouldAddView(controlsToCheck: .duration, in: videoPlayerConfig.controls)
    }
  }
}
