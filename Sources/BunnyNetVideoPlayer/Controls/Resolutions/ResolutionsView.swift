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
    Menu {
      ForEach(viewModel.availableResolutions, id: \.self) { resolution in
        Button {
          viewModel.resolutionAction(resolution)
        } label: {
          HStack {
            Text(resolution.label)
              .font(theme.font.size(14))
            if resolution == viewModel.resolution {
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
      Text(Lingua.Settings.qualityMenuTitle)
        .font(theme.font.size(14))
      
      Spacer()
      
      theme.images.quality
        .aspectRatio(contentMode: .fit)
        .frame(width: 30, height: 30)
        .foregroundColor(.white)
    }
  }
}
