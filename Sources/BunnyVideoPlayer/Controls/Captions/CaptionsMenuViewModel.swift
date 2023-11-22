import SwiftUI

class CaptionsMenuViewModel: ObservableObject {
  private let player: MediaPlayer
  let captions: [Caption]
  @Published var caption: Caption? = nil
  
  init(player: MediaPlayer, captions: [Caption]) {
    self.player = player
    self.captions = captions
  }
  
  func captionAction(_ caption: Caption) {
    self.caption = caption
    player.currentSubtitleLanguage = caption.languageCode
  }
  
  func disableCaptions() {
    caption = nil
    player.currentSubtitleLanguage = nil
  }
}
