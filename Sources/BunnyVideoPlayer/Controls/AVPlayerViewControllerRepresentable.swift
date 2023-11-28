#if os(iOS)
import AVKit
import SwiftUI

struct AVPlayerViewControllerRepresentable: UIViewControllerRepresentable {
  var player: AVPlayer
  var setupAds: ((ViewController) -> Void)?
  
  func makeUIViewController(context: Context) -> AVPlayerViewController {
    let controller = AVPlayerViewController()
    controller.player = player
    context.coordinator.avPlayerViewController = controller
    controller.showsPlaybackControls = false
    if #available(iOS 16.0, *) {
      controller.allowsVideoFrameAnalysis = false
    }
    return controller
  }
  
  func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
    uiViewController.player = player
    setupAds?(uiViewController)
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  class Coordinator: NSObject {
    var avPlayerViewController: AVPlayerViewController?
    var parent: AVPlayerViewControllerRepresentable
    
    init(_ parent: AVPlayerViewControllerRepresentable) {
      self.parent = parent
    }
  }
}

#endif

#if os(macOS)
import AVKit
import SwiftUI

struct AVPlayerViewControllerRepresentable: NSViewRepresentable {
  var player: AVPlayer
  var setupAds: ((ViewController) -> Void)?
  
  func makeNSView(context: Context) -> AVPlayerView {
    let playerView = AVPlayerView()
    playerView.player = player
    playerView.controlsStyle = .none
    return playerView
  }
  
  func updateNSView(_ nsView: AVPlayerView, context: Context) {
    nsView.player = player
  }
}
#endif
