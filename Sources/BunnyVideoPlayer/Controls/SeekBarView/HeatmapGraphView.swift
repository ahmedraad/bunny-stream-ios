import SwiftUI

struct HeatmapGraphView: View {
  @Environment(\.videoPlayerTheme) var theme: VideoPlayerTheme
  let heatmap: Heatmap
  
  /// A value between 0.0 and 1.0
  let playedPercentage: CGFloat
  
  init(heatmap: Heatmap, playedPercentage: CGFloat) {
    self.heatmap = heatmap
    self.playedPercentage = playedPercentage
  }
  
  var body: some View {
    GeometryReader { geometry in
      ZStack(alignment: .leading) {
        curvePath(in: geometry)
          .fill(Color.gray.opacity(0.3))
        
        curvePath(in: geometry)
          .fill(LinearGradient(gradient: Gradient(colors: [theme.tintColor, theme.tintColor.opacity(0.1)]),
                               startPoint: .top,
                               endPoint: .bottom))
          .frame(width: max(0, min(geometry.size.width, geometry.size.width * playedPercentage)))
          .clipped()
      }
    }
  }
}

extension HeatmapGraphView {
  func curvePath(in geometry: GeometryProxy) -> Path {
    var path = Path()
    
    let widthPerKey = geometry.size.width / CGFloat(heatmap.data.count)
    
    var x: CGFloat = 0.0
    var previousPoint: CGPoint? = nil
    
    for key in heatmap.sortedKeys {
      if let second = heatmap(key) {
        let y = geometry.size.height * (1 - CGFloat(second) / heatmap.maxValue)
        let currentPoint = CGPoint(x: x, y: y)
        
        if let prev = previousPoint {
          let control1 = CGPoint(x: prev.x + widthPerKey / 3, y: prev.y)
          let control2 = CGPoint(x: currentPoint.x - widthPerKey / 3, y: currentPoint.y)
          path.addCurve(to: currentPoint, control1: control1, control2: control2)
        } else {
          path.move(to: currentPoint)
        }
        
        previousPoint = currentPoint
        x += widthPerKey
      }
    }
    
    if let lastY = previousPoint?.y {
      path.addLine(to: CGPoint(x: geometry.size.width, y: lastY))
    }
    
    path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height))
    path.addLine(to: CGPoint(x: 0, y: geometry.size.height))
    
    return path
  }
}
