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
    Group {
      Button {
        viewModel.disableCaptions()
      } label: {
        HStack {
          Text(Lingua.Settings.captionDisabled.addCheckmark(viewModel.caption == nil))
            .font(theme.font.size(14))
        }
      }
      ForEach(viewModel.captions, id: \.self) { caption in
        Button {
          viewModel.captionAction(caption)
        } label: {
          Text("\(caption.label) (\(caption.languageCode))".addCheckmark(caption == viewModel.caption))
            .font(theme.font.size(14))
        }
      }
    }
  }
}
