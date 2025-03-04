import SwiftUI

struct ViewSizeKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
    value = nextValue()
  }
}
