import SwiftUI
import CoreText

public class FontManager {
  public static func registerFonts() {
    let bundle = Bundle.module
    let fontURLs = bundle.urls(forResourcesWithExtension: "ttf", subdirectory: nil) ?? []
    
    for url in fontURLs {
      var errorRef: Unmanaged<CFError>?
      CTFontManagerRegisterFontsForURL(url as CFURL, .process, &errorRef)
    }
  }
}
