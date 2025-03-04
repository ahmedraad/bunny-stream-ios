import Foundation

struct Caption: Hashable {
  var languageCode: String
  var label: String
  
  func url(cdn: String, videoId: String) -> URL? {
    URL(string: "https://\(cdn)/\(videoId)/captions/\(languageCode).vtt?ver=1")
  }
}
