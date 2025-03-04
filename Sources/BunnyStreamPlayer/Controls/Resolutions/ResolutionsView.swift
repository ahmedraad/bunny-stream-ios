import SwiftUI

struct ResolutionsView: View {
  @Environment(\.videoPlayerTheme) var theme: VideoPlayerTheme
  @ObservedObject var viewModel: ResolutionsViewModel
  
  var body: some View {
    itemsMenuView()
  }
}

extension ResolutionsView {
  func itemsMenuView() -> some View {
    Group {
      ForEach(viewModel.availableResolutions) { resolution in
        Button {
          viewModel.resolutionAction(resolution)
        } label: {
          Text(resolution.label.addCheckmark(resolution == viewModel.resolution))
            .font(theme.font.size(14))
        }
      }
    }
  }
}
