import SwiftUI

struct ControlsView: View {
  @Environment(\.theme) var theme: Theme
  @ObservedObject var viewModel: BunnyStreamCameraUploadViewModel
  
  var body: some View {
    VStack {
      TopMenuView(viewModel: viewModel)
        .frame(height: 80)
        .environment(\.theme, theme)
      
      Spacer()
      
      BottomMenuView(viewModel: viewModel)
        .environment(\.theme, theme)
    }
    .padding()
  }
}
