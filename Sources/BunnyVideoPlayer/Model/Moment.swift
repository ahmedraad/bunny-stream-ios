import Foundation

struct Moment: Identifiable {
  var id: UUID = UUID()
  var label: String
  var second: UInt
}

extension Moment {
  func contains(_ time: CGFloat, in videoLength: Int) -> Bool {
    let gapPercentage: CGFloat = 0.02
    let gap = min(1.0, CGFloat(videoLength) * gapPercentage)
    
    let lowerBound = CGFloat(second) - gap
    let upperBound = CGFloat(second) + gap
    return time >= lowerBound && time <= upperBound
  }
}
