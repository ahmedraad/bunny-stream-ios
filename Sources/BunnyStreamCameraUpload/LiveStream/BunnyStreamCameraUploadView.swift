import HaishinKit
import SwiftUI

/// A SwiftUI view that provides camera streaming functionality for Bunny Stream uploads.
///
/// This view handles:
/// - Camera stream configuration and display
/// - Permission management for camera and microphone
/// - User controls for streaming
/// - Status messages via snackbar
///
/// Example usage:
/// ```swift
/// let viewModel = BunnyStreamCameraUploadViewModel()
/// let streamView = BunnyStreamCameraUploadView(streamViewModel: viewModel)
/// ```
public struct BunnyStreamCameraUploadView: View {
  /// The visual theme applied to the view.
  @State var theme: Theme = .defaultTheme

  /// The view model that manages the streaming functionality.
  @ObservedObject var streamViewModel: BunnyStreamCameraUploadViewModel

  /// The view model that manages camera and microphone permissions.
  @ObservedObject var permissionsViewModel = PermissionsViewModel()

  /// The presentation mode used to dismiss the view.
  @Environment(\.presentationMode) var presentationMode

  /// The live stream view that displays the camera feed.
  private var lfView: MTHKSwiftUiView!

  /// The view containing stream control buttons and UI elements.
  private var controlsView: ControlsView!

  /// Creates a new camera upload view with the specified stream view model.
  /// - Parameter streamViewModel: The view model that manages streaming functionality.
  init(streamViewModel: BunnyStreamCameraUploadViewModel) {
    self.streamViewModel = streamViewModel
    streamViewModel.configureStream()
    lfView = MTHKSwiftUiView(rtmpStream: $streamViewModel.rtmpStream)
    controlsView = ControlsView(viewModel: streamViewModel)
  }

  /// The body of the view that handles different states:
  /// - Loading state while checking permissions
  /// - Permission request view if permissions aren't granted
  /// - Live stream view if all permissions are granted
  public var body: some View {
    Group {
      if permissionsViewModel.arePermissionsNotDetermined {
        ProgressView()
          .frame(maxWidth: .infinity)
      } else if permissionsViewModel.arePermissionsGranted {
        permissionsView()
      } else {
        liveStreamView()
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

private extension BunnyStreamCameraUploadView {
  /// Creates the live streaming view with camera feed and controls.
  /// - Returns: A view containing the camera feed and streaming controls.
  func liveStreamView() -> some View {
    ZStack {
      lfView
        .ignoresSafeArea()
        .onTapGesture { location in
          self.streamViewModel.tapScreen(touchPoint: location)
        }

      controlsView
        .environment(\.theme, theme)
    }
  }

  /// Creates a view that handles permission-related UI.
  /// - Returns: A view displaying permission status and settings access button.
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
