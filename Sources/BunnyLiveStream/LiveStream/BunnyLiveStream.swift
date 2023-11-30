import HaishinKit
import SwiftUI

public struct BunnyLiveStreamView: View {
  @State var theme: Theme = .defaultTheme
  @ObservedObject var viewModel = BunnyLiveStreamViewModel()
  
  public var body: some View {
    ControlsView(viewModel: viewModel)
      .environment(\.theme, theme)
  }
}
