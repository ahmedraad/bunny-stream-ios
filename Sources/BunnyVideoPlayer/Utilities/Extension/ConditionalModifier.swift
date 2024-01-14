import SwiftUI

struct ConditionalModifier: ViewModifier {
  var shouldShow: Bool
  
  func body(content: Content) -> some View {
    if shouldShow {
      content
    }
  }
}

extension View {
  func shouldAddView(_ condition: Bool) -> some View {
    self.modifier(ConditionalModifier(shouldShow: condition))
  }
  
  func shouldAddView(controlsToCheck: VideoPlayerConfig.Control..., in controls: [VideoPlayerConfig.Control]) -> some View {
    self.modifier(ConditionalModifier(shouldShow: Set(controlsToCheck).isSubset(of: Set(controls))))
  }
}
