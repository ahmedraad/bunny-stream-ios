import SwiftUI

struct BottomMenuView: View {
  @Environment(\.theme) var theme: Theme
  @ObservedObject var viewModel: BunnyLiveStreamViewModel
  
  var body: some View {
    HStack(spacing: 50) {
      micButton
      streamButton
      flipCameraButton
    }
  }
}

private extension BottomMenuView {
  var micButton: some View {
    Button(action: toggleMic) {
      buttonContent(icon: viewModel.isMuted ? theme.icons.mutedMic : theme.icons.mic)
    }
    .frame(width: 50, height: 50)
  }
  
  var streamButton: some View {
    Button(action: toggleStream) {
      buttonContent(icon: viewModel.isLiveStreaming ? theme.icons.stopStream : theme.icons.stream,
                    background: .white,
                    iconPadding: viewModel.isLiveStreaming ? 20 : 12,
                    foregroundColor: .black)
    }
    .foregroundColor(.black)
    .frame(width: 65, height: 65)
  }
  
  var flipCameraButton: some View {
    Button(action: flipCamera) {
      buttonContent(icon: theme.icons.flipCamera)
    }
    .frame(width: 50, height: 50)
  }
  
  func buttonContent(
    icon: Image,
    background: Color = .black.opacity(0.4),
    iconPadding: CGFloat = 12,
    foregroundColor: Color = .white
  ) -> some View {
    Capsule()
      .fill(background)
      .overlay {
        icon
          .resizable()
          .scaledToFit()
          .padding(iconPadding)
          .foregroundColor(foregroundColor)
      }
  }
  
  func toggleMic() {}
  
  func toggleStream() {}
  
  func flipCamera() {}
}
