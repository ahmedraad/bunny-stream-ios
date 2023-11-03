import SwiftUI

struct MomentView: View {
  private let diameter: CGFloat
  private let innerOpacity: Double
  private let outerOpacity: Double
  
  init(diameter: CGFloat, innerOpacity: Double = 0.4, outerOpacity: Double = 0.8) {
    self.diameter = diameter
    self.innerOpacity = innerOpacity
    self.outerOpacity = outerOpacity
  }
  
  var body: some View {
    Circle()
      .stroke(Color.white.opacity(outerOpacity), lineWidth: diameter * 0.2)
      .background(
        Circle().fill(Color.white.opacity(innerOpacity))
      )
      .frame(width: diameter, height: diameter)
  }
}

