import Foundation

struct StreamConfig {
  var uri: String = "rtmp://94.130.242.34/ingest"
  var streamKey: String
  
  init(videoId: String, accessKey: String, libraryId: Int) {
    self.streamKey = "?vid=\(videoId)&accessKey=\(accessKey)&lib=\(libraryId)"
  }
}
