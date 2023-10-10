import Foundation

public struct VideoInfo {
  let content: VideoContent
  let title: String
  let collectionId: String?
  let libraryId: Int
  let expirationTime: TimeInterval
  
  public init(content: VideoContent,
              title: String,
              collectionId: String? = nil,
              libraryId: Int,
              expirationTime: TimeInterval = Date().addingTimeInterval(3600).timeIntervalSince1970) {
    self.content = content
    self.title = title
    self.collectionId = collectionId
    self.libraryId = libraryId
    self.expirationTime = expirationTime
  }
  
  public var videoTitle: String {
    if let fileExtension = content.fileExtension {
      return (title + ".\(fileExtension)").uppercased()
    } else {
      return title
    }
  }
  
  public var expirationTimeString: String {
    "\(String(format: "%.0f", expirationTime))"
  }
}
