import Foundation

public struct VideoInfo: Hashable {
  public let content: VideoContent
  public let title: String
  public let fileType: String
  public let videoId: String
  public let collectionId: String?
  public let libraryId: Int
  public let expirationTime: TimeInterval
  
  public init(content: VideoContent,
              title: String,
              fileType: String,
              videoId: String,
              collectionId: String? = nil,
              libraryId: Int,
              expirationTime: TimeInterval = Date().addingTimeInterval(3600).timeIntervalSince1970) {
    self.content = content
    self.title = title
    self.videoId = videoId
    self.fileType = fileType
    self.collectionId = collectionId
    self.libraryId = libraryId
    self.expirationTime = expirationTime
  }
  
  public var expirationTimeString: String {
    "\(String(format: "%.0f", expirationTime))"
  }
}
