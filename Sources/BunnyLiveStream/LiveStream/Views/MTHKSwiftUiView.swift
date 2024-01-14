#if os(iOS)
import Foundation
import HaishinKit
import SwiftUI

struct MTHKSwiftUiView: UIViewRepresentable {
  var mthkView = MTHKView(frame: .zero)
  
  @Binding var rtmpStream: RTMPStream
  
  func makeUIView(context: Context) -> MTHKView {
    mthkView.videoGravity = .resizeAspectFill
    return mthkView
  }
  
  func updateUIView(_ uiView: MTHKView, context: Context) {
    mthkView.attachStream(rtmpStream)
  }
}

#elseif os(macOS)
import AVKit
import HaishinKit
import SwiftUI

struct MTHKSwiftUiView: NSViewRepresentable {
  var mthkView = MTHKView(frame: .zero)
  @Binding var rtmpStream: RTMPStream
  
  func makeNSView(context: Context) -> NSView {
    return NSView(frame: .zero)
  }
  
  func updateNSView(_ nsView: NSView, context: Context) {
  }
}
#endif
