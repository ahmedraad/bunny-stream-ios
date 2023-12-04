import SwiftUI

struct PlaybackSpeedView: View {
  @Environment(\.videoPlayerTheme) var theme: VideoPlayerTheme
  @ObservedObject var viewModel: PlaybackSpeedViewModel
  
  var body: some View {
    itemsMenuView()
  }
}

extension PlaybackSpeedView {
  func itemsMenuView() -> some View {
    Group {
      ForEach(viewModel.playbackSpeeds, id: \.self) { speed in
        Button {
          viewModel.playbackSpeedAction(speed)
        } label: {
          Text(speed.title.addCheckmark(speed == viewModel.playbackSpeed))
            .font(theme.font.size(14))
            .foregroundColor(theme.tintColor)
        }
      }
    }
  }
}
