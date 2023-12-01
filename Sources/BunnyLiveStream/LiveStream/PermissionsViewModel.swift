import AVFoundation
import Combine
import SwiftUI

class PermissionsViewModel: ObservableObject {
  @Published var cameraAccess: AVAuthorizationStatus
  @Published var microphoneAccess: AVAudioSession.RecordPermission
  
  private var appStateSubscriber: AnyCancellable?
  
  var arePermissionsGranted: Bool {
    cameraAccess != .authorized || microphoneAccess != .granted
  }
  
  var arePermissionsNotDetermined: Bool {
    cameraAccess == .notDetermined || microphoneAccess == .undetermined
  }
  
  init() {
    cameraAccess = AVCaptureDevice.authorizationStatus(for: .video)
    microphoneAccess = AVAudioSession.sharedInstance().recordPermission
    appStateSubscriber = NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)
      .sink { [weak self] _ in
        self?.updatePermissions()
      }
  }
  
  private func updatePermissions() {
    cameraAccess = AVCaptureDevice.authorizationStatus(for: .video)
    microphoneAccess = AVAudioSession.sharedInstance().recordPermission
  }
}
