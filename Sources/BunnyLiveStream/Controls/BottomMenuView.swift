import SwiftUI

struct BottomMenuView: View {
  @Environment(\.theme) var theme: Theme
  @ObservedObject var viewModel: BunnyLiveStreamViewModel
  @State private var showEndStreamingAlert: Bool = false
  
  var body: some View {
    HStack(spacing: 50) {
      micButton
      streamButton
      flipCameraButton
    }
    .alert(isPresented: $showEndStreamingAlert) {
      Alert(
        title: Text(Lingua.LiveStream.endStreamAlertTitle),
        message: Text(Lingua.LiveStream.endStreamAlertMessage),
        primaryButton: .destructive(Text(Lingua.LiveStream.endStreamAlertConfirmAction)) {
          viewModel.stopPublish()
        },
        secondaryButton: .cancel()
      )
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
      buttonContent(icon: viewModel.state == .notStreaming ? theme.icons.stream : theme.icons.stopStream,
                    background: viewModel.state == .liveStreaming ? Color.red : Color.white,
                    iconPadding: viewModel.state == .notStreaming ? 12 : 20,
                    foregroundColor: viewModel.state == .liveStreaming ? .white : .black)
      .overlay {
        if viewModel.state == .preparing {
          CircularProgressView(progress: viewModel.countdownProgress)
            .frame(width: 65, height: 65)
        }
      }
    }
    .disabled(viewModel.isCreatingVideo)
    .frame(width: 65, height: 65)
  }
  
  var flipCameraButton: some View {
    Button(action: rotateCamera) {
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
  
  func toggleMic() {
    viewModel.toggleMute()
  }
  
  func toggleStream() {
    switch viewModel.state {
    case .preparing:
      viewModel.stopCountdownStreamingTimer()
    case .liveStreaming:
      showEndStreamingAlert = true
    case .notStreaming:
      viewModel.startStreamingCountdown()
    }
  }
  
  func rotateCamera() {
    viewModel.rotateCamera()
  }
}
