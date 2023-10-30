import SwiftUI

class SeekBarViewModel: ObservableObject {
  @Published var elapsedTime: Double = .zero
  @Published var thumbnailImage: Image?
  @Published var thumbnailTime: String = ""
  @Published var thumbnailSize: CGSize = .zero
  
  let player: MediaPlayer
  
  init(player: MediaPlayer) {
    self.player = player
  }
  
  var duration: Double {
    player.duration
  }
  
  func seek(to percentage: Double) {
    let seekTimeSeconds = duration * percentage
    player.jump(to: seekTimeSeconds)
  }
  
  @MainActor
  func generateThumbnail(at seconds: Double) async {
    let thumbnail = await player.generateThumbnail(at: seconds)
    if let thumbnailImage = thumbnail.image {
      self.thumbnailImage = thumbnailImage
      let widthScale = SeekBarView.UI.thumbnailSize / thumbnail.size.width
      let heightScale = SeekBarView.UI.thumbnailSize / thumbnail.size.height
      let scale = min(widthScale, heightScale)

      thumbnailSize = CGSize(width: scale * thumbnail.size.width, height: scale * thumbnail.size.height)
      thumbnailTime = seconds.toFormattedTime()
    }
  }
}
