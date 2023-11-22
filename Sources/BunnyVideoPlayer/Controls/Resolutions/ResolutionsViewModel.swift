import SwiftUI

class ResolutionsViewModel: ObservableObject {
  private let player: MediaPlayer
  @Published var resolution: Video.Resolution = .auto
  let availableResolutions: [Video.Resolution]
  
  init(player: MediaPlayer, video: Video) {
    self.player = player
    self.availableResolutions = video.resolutions
  }
  
  func resolutionAction(_ resolution: Video.Resolution) {
    player.setPlayerBitrate(resolution.bitrate)
    self.resolution = resolution
  }
}
