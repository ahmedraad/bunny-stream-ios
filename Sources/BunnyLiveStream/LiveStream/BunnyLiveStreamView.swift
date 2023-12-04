import HaishinKit
import SwiftUI

public struct BunnyLiveStreamView: View {
  @State var theme: Theme = .defaultTheme
  @ObservedObject var streamViewModel: BunnyLiveStreamViewModel
  @ObservedObject var permissionsViewModel = PermissionsViewModel()
  @Environment(\.presentationMode) var presentationMode
  
  private var lfView: MTHKSwiftUiView!
  private var controlsView: ControlsView!
  
  init(streamViewModel: BunnyLiveStreamViewModel) {
    self.streamViewModel = streamViewModel
    streamViewModel.configureStream()
    lfView = MTHKSwiftUiView(rtmpStream: $streamViewModel.rtmpStream)
    controlsView = ControlsView(viewModel: streamViewModel)
  }
  
  public var body: some View {
    Group {
      if permissionsViewModel.arePermissionsNotDetermined {
        ProgressView()
          .frame(maxWidth: .infinity)
      } else if permissionsViewModel.arePermissionsGranted {
        permissionsView()
      } else {
        lfView
          .ignoresSafeArea()
          .onTapGesture { location in
            self.streamViewModel.tapScreen(touchPoint: location)
          }
        
        controlsView
          .environment(\.theme, theme)
      }
    }
    .overlay(alignment: .bottom) {
      if let message = streamViewModel.snackbarMessage  {
        SnackbarView(message: message) {
          streamViewModel.snackbarMessage = nil
        }
        .transition(.move(edge: .bottom))
      }
    }
    .onAppear {
      streamViewModel.registerForPublishEvent()
    }
    .onDisappear {
      streamViewModel.unregisterForPublishEvent()
    }
  }
}

private extension BunnyLiveStreamView {
  func permissionsView() -> some View {
    VStack {
      HStack {
        Spacer()
        
        Button {
          presentationMode.wrappedValue.dismiss()
        } label: {
          theme.icons.close
            .resizable()
            .scaledToFill()
        }
        .frame(width: 20, height: 20)
      }
      
      Spacer()
      
      Text(Lingua.LiveStream.cameraMicPermissionsError)
      
      Button(Lingua.LiveStream.openSettingsButton) {
#if os(iOS)
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString),
              UIApplication.shared.canOpenURL(settingsUrl) else {
          return
        }
        
        UIApplication.shared.open(settingsUrl)
#endif
      }
      
      Spacer()
    }
    .padding()
  }
}
