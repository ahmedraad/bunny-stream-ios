import SwiftUI

/// `OnTap` is a SwiftUI view modifier that adds tap gesture handling to a view.
/// It captures the tap location and triggers a response closure with this location.
///
/// Properties:
/// - `response`: A closure of type `(CGPoint) -> Void`. This closure is executed when a tap gesture is recognized, passing the tap location.
/// - `location`: A `@State` private variable that stores the tap location. It is updated every time a tap is detected.
///
struct OnTap: ViewModifier {
  let response: (CGPoint) -> Void
  @State private var location: CGPoint = .zero
  
  func body(content: Content) -> some View {
    content
      .onTapGesture {
        response(location)
      }
      .simultaneousGesture(
        DragGesture(minimumDistance: 0)
          .onEnded { location = $0.location }
      )
  }
}

extension View {
  func onTapGesture(_ handler: @escaping (CGPoint) -> Void) -> some View {
    self.modifier(OnTap(response: handler))
  }
}
