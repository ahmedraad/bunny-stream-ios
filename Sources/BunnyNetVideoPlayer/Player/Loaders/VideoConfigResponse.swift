import Foundation

struct VideoConfigResponse: Decodable {
  var captionsFontSize: Int
  var captionsFontColor: String
  var captionsBackground: String
  var playerKeyColor: String
  var fontFamily: String
  var vastTagUrl: String
  var showHeatmap: Bool
  var controls: Controls
  
  enum CodingKeys: String, CodingKey {
    case captionsFontSize = "CaptionsFontSize"
    case captionsFontColor = "CaptionsFontColor"
    case captionsBackground = "CaptionsBackground"
    case playerKeyColor = "PlayerKeyColor"
    case fontFamily = "FontFamily"
    case vastTagUrl = "VastTagUrl"
    case showHeatmap = "ShowHeatmap"
    case controls = "Controls"
  }
}

extension VideoConfigResponse {
  enum Control: String, Decodable, CaseIterable, Equatable {
    case rewind
    case fastForward = "fast-forward"
    case playLarge = "play-large"
    case captions
    case currentTime = "current-time"
    case duration
    case fullScreen = "fullscreen"
    case mute
    case pip
    case play
    case progress
    case settings
    case volume
  }
  
  struct Controls: Decodable {
    var controlList: [Control]
    
    init(from decoder: Decoder) throws {
      let container = try decoder.singleValueContainer()
      let controlsString = try container.decode(String.self)
      self.controlList = controlsString.split(separator: ",").compactMap { Control(rawValue: String($0)) }
    }
  }
}
