import SwiftUI

class PlaybackSpeedViewModel: ObservableObject {
  private let player: MediaPlayer
  @Published var playbackSpeed: PlaybackSpeed = .default
  @Published var showPlaybackSpeed = false
  let playbackSpeeds: [PlaybackSpeed] = .playbackSpeeds
  
  init(player: MediaPlayer) {
    self.player = player
    playbackSpeed = .init(speed: player.playerSpeed)
  }
  
  func playbackSpeedAction(_ playbackSpeed: PlaybackSpeed) {
    player.playerSpeed = playbackSpeed.speed
    self.playbackSpeed = playbackSpeed
  }
}
