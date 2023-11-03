import Foundation

struct Moment: Identifiable {
  var id: UUID = UUID()
  var label: String
  var second: UInt
}

extension Moment {
  func contains(_ time: CGFloat) -> Bool {
    let lowerBound = CGFloat(second) - 1.0
    let upperBound = CGFloat(second) + 1.0
    return time >= lowerBound && time <= upperBound
  }
}
