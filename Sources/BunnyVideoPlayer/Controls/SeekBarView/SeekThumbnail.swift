import Foundation

struct SeekThumbnail {
  var thumbnailUrls: [URL]
  var frameDurationPerThumbnail: Int
  var thumbnailCount: Int
  var thumbnailsPerImage: Int
  let maxColumns = 6
  let maxRows = 6
}
