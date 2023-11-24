import SwiftUI
import CoreText

class FontManager {
  static func registerFonts() {
    let bundle = Bundle.module
    let fontURLs = bundle.urls(forResourcesWithExtension: "ttf", subdirectory: nil) ?? []
    
    for url in fontURLs {
      var errorRef: Unmanaged<CFError>?
      CTFontManagerRegisterFontsForURL(url as CFURL, .process, &errorRef)
    }
  }
}
