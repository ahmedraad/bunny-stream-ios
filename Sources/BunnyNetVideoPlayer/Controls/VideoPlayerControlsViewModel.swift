import Combine
import AVKit
import SwiftUI

class VideoPlayerViewModel: ObservableObject {
  @Published var player: MediaPlayer
  
  @Published var isFullScreen: Bool = false
  @Published var isMuted: Bool = false
  @Published var isPlaying: Bool = false
  @Published var playbackState: MediaPlayer.PlaybackState = .preparing
  @Published var elapsedTime: Double = 0
  @Published var sliderValue: Double = 0.0
  
  init(player: MediaPlayer) {
    self.player = player
  }
}

extension VideoPlayerViewModel {
  var currentFormattedTime: String {
    secondsToTime(elapsedTime)
  }
  
  var totalFormattedTime: String {
    secondsToTime(player.duration)
  }

  func togglePlayPause() {
    if player.isPlaying {
      player.pause()
    } else {
      player.play()
    }
  }
  
  func skipBackward() {
    guard playbackState != .readyToPlay else { return }
    let newTime = player.currentTimeSeconds - 10
    player.jump(to: newTime)
  }
  
  func skipForward() {
    guard playbackState != .ended else { return }
    let newTime = player.currentTimeSeconds + 10
    player.jump(to: newTime)
  }
  
  func toggleFullScreenMode() {
    withAnimation {
      isFullScreen.toggle()
    }
  }
  
  func toggleMute() {
    isMuted.toggle()
    player.isMuted = isMuted
  }
  
  func optionsAction() { }
  
  func airplayAction() { }
}

private extension VideoPlayerViewModel {
  func secondsToTime(_ seconds: Double) -> String {
    let hours = Int(seconds) / 3600
    let minutes = (Int(seconds) % 3600) / 60
    let seconds = Int(seconds) % 60
    
    if hours > 0 {
      return String(format: "%d:%02d:%02d", hours, minutes, seconds)
    } else {
      return String(format: "%d:%02d", minutes, seconds)
    }
  }
}

// MARK: - MediaPlayerDelegate
extension VideoPlayerViewModel: MediaPlayerDelegate {
  func mediaPlayer(didBeginPlayback player: MediaPlayer) {
    isPlaying = true
  }
  
  func mediaPlayer(didPausePlayback player: MediaPlayer) {
    isPlaying = false
  }
  
  func mediaPlayer(didEndPlayback player: MediaPlayer) {
    isPlaying = false
    player.jump(to: 0)
  }
  
  func mediaPlayer(_ player: MediaPlayer, didProgressToTime seconds: Double) {
    elapsedTime = seconds
  }
  
  func mediaPlayer(_ player: MediaPlayer, didFailWithError error: Error) {
    playbackState = .failed(error: error)
  }
  
  func mediaPlayer(_ player: MediaPlayer, didUpdatePlaybackState playbackState: MediaPlayer.PlaybackState) {
    self.playbackState = playbackState
  }
}
