import Combine
import SwiftUI

class VideoPlayerViewModel: ObservableObject {
  @Published var isVisible: Bool = true
  @Published var isPlaying: Bool = false
  @Published var isDraggingSeekBar: Bool = false
  var hideControlsTimer: Timer?
  let hideAfterSeconds: Double = 3.0
  
  deinit {
    hideControlsTimer?.invalidate()
  }
  
  func resetControlsHideTimer(_ active: Bool = true) {
    hideControlsTimer?.invalidate()
    hideControlsTimer = Timer.scheduledTimer(withTimeInterval: hideAfterSeconds, repeats: false) { [weak self] _ in
      self?.hideControls()
    }
  }
  
  func toggleControlsVisibility() {
    withAnimation {
      isVisible.toggle()
    }
    if isVisible {
      resetControlsHideTimer()
    }
  }

  func isPlayingChange(_ isPlaying: Bool) {
    self.isPlaying = isPlaying
    if isPlaying {
      resetControlsHideTimer()
    } else {
      hideControlsTimer?.invalidate()
    }
  }
  
  func isDraggingSeekBarChange(_ isDraggingSeekBar: Bool) {
    self.isDraggingSeekBar = isDraggingSeekBar
    resetControlsHideTimer()
  }
  
  func playBackStateChange(_ state:  MediaPlayer.PlaybackState) {
    if state == .ended {
      withAnimation {
        isVisible = true
      }
    }
  }
}

private extension VideoPlayerViewModel {
  func hideControls() {
    guard isPlaying, !isDraggingSeekBar else { return }
    withAnimation {
      isVisible = false
    }
  }
}
