import Foundation

struct Video {
  var guid: String
  var chaptersList: ValidatedChapterList?
  var moments: [Moment]
  var thumbnailCount: Int
  var width: CGFloat
  var height: CGFloat
  var length: Double
  var cdn: String
}

extension Video {
  var seekThumbnail: SeekThumbnail {
    let thumbnailsPerImage = 36
    let urls = seekThumbnailURLs(thumbnailsPerImage: thumbnailsPerImage)
    let frameDurationPerThumbnail = Int(floor(length / Double(thumbnailCount)))
    
    return SeekThumbnail(
      thumbnailUrls: urls,
      frameDurationPerThumbnail: frameDurationPerThumbnail,
      thumbnailCount: thumbnailCount,
      thumbnailsPerImage: thumbnailsPerImage
    )
  }
  
  func seekThumbnailURLs(thumbnailsPerImage: Int) -> [URL] {
    let numberOfPreviews = Int(ceil(Double(thumbnailCount) / Double(thumbnailsPerImage)))
    return (0..<numberOfPreviews).compactMap {
      URL(string: "https://\(cdn)/\(guid)/seek/_\($0).jpg")
    }
  }
}
