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
    Menu {
      ForEach(viewModel.playbackSpeeds, id: \.self) { speed in
        Button {
          viewModel.playbackSpeedAction(speed)
        } label: {
          HStack {
            Text(speed.title)
              .font(theme.font.size(14))
            if speed == viewModel.playbackSpeed {
              Image(systemName: "checkmark")
              Spacer()
            }
          }
        }
      }
    } label: {
      sectionView()
    }
  }
  
  func sectionView() -> some View {
    HStack {
      Text(Lingua.Settings.playbackSpeedMenuTitle)
        .font(theme.font.size(14))
      
      Spacer()
      
      theme.images.playbackSpeed
        .aspectRatio(contentMode: .fit)
        .frame(width: 30, height: 30)
        .foregroundColor(.white)
    }
  }
}

extension PlaybackSpeedView: Equatable {
  static func ==(lhs: PlaybackSpeedView, rhs: PlaybackSpeedView) -> Bool {
    return lhs.viewModel.playbackSpeed == rhs.viewModel.playbackSpeed
  }
}
