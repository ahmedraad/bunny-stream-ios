import Foundation

struct VideoConfigResponse: Decodable {
  var captionsFontSize: Int
  var captionsFontColor: String
  var captionsBackground: String
  var playerKeyColor: String
  var fontFamily: String
  var vastTagUrl: String
  var showHeatmap: Bool
  var controls: [Control]
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    captionsFontSize = try container.decode(Int.self, forKey: .captionsFontSize)
    captionsFontColor = try container.decode(String.self, forKey: .captionsFontColor)
    captionsBackground = try container.decode(String.self, forKey: .captionsBackground)
    playerKeyColor = try container.decode(String.self, forKey: .playerKeyColor)
    fontFamily = try container.decode(String.self, forKey: .fontFamily)
    vastTagUrl = try container.decode(String.self, forKey: .vastTagUrl)
    showHeatmap = try container.decode(Bool.self, forKey: .showHeatmap)
    
    let controlsString = try container.decode(String.self, forKey: .controls)
    let controlNames = controlsString.split(separator: ",").map(String.init)
    controls = controlNames.compactMap { Control(rawValue: $0) }
  }
  
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
}
