import SwiftUI

struct ThemeKey: EnvironmentKey {
  static let defaultValue = Theme.defaultTheme
}

extension EnvironmentValues {
  var theme: Theme {
    get { self[ThemeKey.self] }
    set { self[ThemeKey.self] = newValue }
  }
}
