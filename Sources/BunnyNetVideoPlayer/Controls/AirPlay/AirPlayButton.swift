#if os(iOS)
import AVKit
import SwiftUI

struct AirPlayButton: UIViewRepresentable {
    func makeUIView(context: Context) -> AVRoutePickerView {
        let routePickerView = AVRoutePickerView()
        routePickerView.backgroundColor = .clear
        routePickerView.tintColor = .white
        routePickerView.prioritizesVideoDevices = true
        routePickerView.activeTintColor = .white
        return routePickerView
    }
    
    func updateUIView(_ uiView: AVRoutePickerView, context: Context) {}
}
#endif

#if os(macOS)
import SwiftUI

struct AirPlayButton: NSViewRepresentable {
  func makeNSView(context: Context) -> NSView {
    let label = NSTextField(labelWithString: "AirPlay")
    label.isBezeled = false
    label.drawsBackground = false
    label.isEditable = false
    label.isSelectable = false
    return label
  }
  
  func updateNSView(_ nsView: NSView, context: Context) {}
}
#endif
