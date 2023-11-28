import SwiftUI
import CoreGraphics

#if os(iOS)
import UIKit
typealias PlatformImage = UIImage
typealias ViewController = UIViewController
#elseif os(macOS)
import AppKit
typealias PlatformImage = NSImage
typealias ViewController = NSViewController
#endif

extension Image {
  init(platformImage: PlatformImage) {
#if os(iOS)
    self.init(uiImage: platformImage)
#elseif os(macOS)
    self.init(nsImage: platformImage)
#endif
  }
}
