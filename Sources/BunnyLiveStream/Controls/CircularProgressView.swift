import SwiftUI

struct CircularProgressView: View {
  var progress: CGFloat
  
  var body: some View {
    Circle()
      .trim(from: 0.0, to: progress)
      .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
      .foregroundColor(Color.red)
      .rotationEffect(Angle(degrees: 270.0))
      .animation(.linear(duration: 0.1), value: progress)
  }
}

