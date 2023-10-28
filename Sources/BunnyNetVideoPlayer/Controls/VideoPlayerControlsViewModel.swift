import Combine
import AVKit
import SwiftUI

class VideoPlayerControlsViewModel: ObservableObject {
  var player: MediaPlayer
  @Published var isFullScreen: Bool = false
  @Published var isMuted: Bool = false
  @Published var isPlaying: Bool = false
  @Published var playbackState: MediaPlayer.PlaybackState = .preparing
  @Published var elapsedTime: Double = 0
  
  init(player: MediaPlayer) {
    self.player = player
    setupPlayer()
  }
}

extension VideoPlayerControlsViewModel {
  var duration: Double {
    player.duration
  }
  
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
    let elapsedTime = max(elapsedTime - 10, 0)
    player.jump(to: elapsedTime)
  }
  
  func skipForward() {
    guard playbackState != .ended else { return }
    let elapsedTime = min(elapsedTime + 10, player.duration)
    player.jump(to: elapsedTime)
  }
  
  func toggleFullScreenMode() {
    var transaction = Transaction()
    transaction.disablesAnimations = true
    withTransaction(transaction) {
      isFullScreen.toggle()
    }
  }
  
  func toggleMute() {
    isMuted.toggle()
    player.isMuted = isMuted
  }
  
  func optionsAction() { }
  
  func airplayAction() { }
  
  func generateThumbnail(at seconds: Double) async -> Image? {
    await player.generateThumbnail(at: seconds)
  }
  
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

private extension VideoPlayerControlsViewModel {
  func setupPlayer() {
    player.delegate = self
    isMuted = player.isMuted
    isPlaying = player.isPlaying
    playbackState = player.state
    elapsedTime = player.currentTimeSeconds
  }
}

// MARK: - MediaPlayerDelegate
extension VideoPlayerControlsViewModel: MediaPlayerDelegate {
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
  
  func mediaPlayer(_ player: MediaPlayer, didChangeVolume volume: Float) {
    self.isMuted = volume.isZero
  }
}
