import SwiftUI

struct Theme {
  var icons: Icons
}

// MARK: - Default theme
extension Theme {
  static let defaultTheme = Theme(icons: Icons())
}
