import SwiftUI
import AVKit

public struct VideoPlayerView: View {
  @State var player: AVPlayer
  
  public init(player: AVPlayer) {
    self.player = player
  }
  
  public var body: some View {
    ZStack {
      VideoPlayer(player: player)
        .disabled(true)
      VideoPlayerControls(player: player)
    }
  }
}
