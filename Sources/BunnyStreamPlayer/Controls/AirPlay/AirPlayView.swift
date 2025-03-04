#if os(iOS)
import AVKit
import SwiftUI

struct AirPlayView: UIViewRepresentable {
  
  private let routePickerView = AVRoutePickerView()
  
  func makeUIView(context: UIViewRepresentableContext<AirPlayView>) -> UIView {
    UIView()
  }
  
  func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<AirPlayView>) {
    routePickerView.backgroundColor = .clear
    routePickerView.tintColor = .white
    routePickerView.prioritizesVideoDevices = true
    routePickerView.activeTintColor = .white
    
    routePickerView.translatesAutoresizingMaskIntoConstraints = false
    uiView.addSubview(routePickerView)
    
    NSLayoutConstraint.activate([
      routePickerView.topAnchor.constraint(equalTo: uiView.topAnchor),
      routePickerView.leadingAnchor.constraint(equalTo: uiView.leadingAnchor),
      routePickerView.bottomAnchor.constraint(equalTo: uiView.bottomAnchor),
      routePickerView.trailingAnchor.constraint(equalTo: uiView.trailingAnchor)
    ])
  }
  
  func showAirPlayMenu() {
    for view: UIView in routePickerView.subviews {
      if let button = view as? UIButton {
        button.sendActions(for: .touchUpInside)
        break
      }
    }
  }
}

#endif

#if os(macOS)
import SwiftUI

struct AirPlayView: NSViewRepresentable {
  
  func makeNSView(context: Context) -> NSView {
    return NSView()
  }
  
  func updateNSView(_ nsView: NSView, context: Context) {}
  
  func showAirPlayMenu() {}
}
#endif
