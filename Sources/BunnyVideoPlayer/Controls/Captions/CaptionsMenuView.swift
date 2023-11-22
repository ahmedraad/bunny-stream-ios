import SwiftUI

struct CaptionsMenuView: View {
  @Environment(\.videoPlayerTheme) var theme: VideoPlayerTheme
  @ObservedObject var viewModel: CaptionsMenuViewModel
  
  var body: some View {
    itemsMenuView()
  }
}

extension CaptionsMenuView {
  func itemsMenuView() -> some View {
    Menu {
      Button {
        viewModel.disableCaptions()
      } label: {
        HStack {
          Text(Lingua.Settings.captionDisabled)
            .font(theme.font.size(14))
        }
      }
      ForEach(viewModel.captions, id: \.self) { caption in
        Button {
          viewModel.captionAction(caption)
        } label: {
          HStack {
            Text("\(caption.label) (\(caption.languageCode))")
              .font(theme.font.size(14))
            if caption == viewModel.caption {
              Image(systemName: "checkmark")
              Spacer()
            }
          }
        }
      }
    } label: {
      sectionView()
    }
    .font(theme.font.size(14))
  }
  
  func sectionView() -> some View {
    HStack {
      Text(Lingua.Settings.captionMenuTitle)
      
      Spacer()
      
      theme.images.captions
        .aspectRatio(contentMode: .fit)
        .frame(width: 30, height: 30)
        .foregroundColor(.white)
    }
  }
}
