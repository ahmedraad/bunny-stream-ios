import SwiftUI

class SeekBarViewModel: ObservableObject {
  @Published var video: Video
  @Published var heatmap: Heatmap
  @Published var elapsedTime: Double = .zero
  @Published var thumbnailImage: Image?
  @Published var thumbnailTime: String = ""
  @Published var thumbnailSize: CGSize = .zero
  
  let player: MediaPlayer
  
  init(player: MediaPlayer, video: Video, heatmap: Heatmap) {
    self.player = player
    self.video = video
    self.heatmap = heatmap
  }
  
  var duration: Double {
    round(player.duration)
  }
  
  var thumbnailYOffset: CGFloat {
    if thumbnailSize.width > thumbnailSize.height {
      return -thumbnailSize.height * 1.5
    } else {
      return -thumbnailSize.width * 1.8
    }
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
