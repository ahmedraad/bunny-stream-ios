import SwiftUI
import AVKit

public struct VideoPlayerView: View {
  @State var player: MediaPlayer
  
  public init(player: MediaPlayer) {
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
