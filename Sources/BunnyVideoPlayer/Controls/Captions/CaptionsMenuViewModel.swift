import SwiftUI

class CaptionsMenuViewModel: ObservableObject {
  private let player: MediaPlayer
  let captions: [Caption]
  @Published var caption: Caption? = nil
  @Published var showCaptions = false
  @Published var enableCaptions = false
  
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
    enableCaptions = false
  }
  
  func toggleCaptions() {
    if player.currentSubtitleLanguage == nil {
      if caption == nil {
        captions.first.map { captionAction($0) }
      }
      player.currentSubtitleLanguage = caption?.languageCode
      enableCaptions = true
    } else {
      player.currentSubtitleLanguage = nil
      enableCaptions = false
    }
  }
}
