import SwiftUI

struct CaptionsMenuView: View {
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
          Text("Disabled")
        }
      }
      ForEach(viewModel.captions, id: \.self) { caption in
        Button {
          viewModel.captionAction(caption)
        } label: {
          HStack {
            Text("\(caption.label) (\(caption.languageCode))")
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
  }
  
  func sectionView() -> some View {
    HStack {
      Text("Captions")
      
      Spacer()
      
      Image(systemName: "captions.bubble")
        .aspectRatio(contentMode: .fit)
        .frame(width: 30, height: 30)
        .foregroundColor(.white)
    }
  }
}
