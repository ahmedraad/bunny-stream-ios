import Foundation

struct PlaybackSpeed: Hashable {
  let speed: Float
  
  var title: String {
    guard speed != 1.0 else { return "Normal" }
    let formattedString = String(format: "%.2f", speed)
    if formattedString.hasSuffix("0") {
      return String(format: "%.1fx", speed)
    }
    return "\(formattedString)x"
  }
}

extension PlaybackSpeed {
  static var `default`: PlaybackSpeed { .init(speed: 1.0) }
}

extension [PlaybackSpeed] {
  static var playbackSpeeds: [PlaybackSpeed] = [.init(speed: 0.5), .init(speed: 0.75), .default, .init(speed: 1.25)]
}
