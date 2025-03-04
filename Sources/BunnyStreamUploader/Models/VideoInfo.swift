import Foundation

/// A structure that contains metadata and content information for a video to be uploaded.
///
/// `VideoInfo` encapsulates all the necessary information needed to upload a video to the server,
/// including its content, metadata, and organizational information such as library and collection IDs.
public struct VideoInfo: Hashable {
  /// The actual video content to be uploaded.
  public let content: VideoContent
  
  /// The title of the video.
  public let title: String
  
  /// The file type/extension of the video (e.g., "mp4", "mov").
  public let fileType: String
  
  /// A unique identifier for the video.
  public let videoId: String
  
  /// An optional identifier for the collection this video belongs to.
  public let collectionId: String?
  
  /// The identifier of the library where this video will be stored.
  public let libraryId: Int
  
  /// The timestamp when the upload URL will expire, in seconds since 1970.
  public let expirationTime: TimeInterval
  
  /// Creates a new video info instance with the specified parameters.
  ///
  /// - Parameters:
  ///   - content: The video content to be uploaded.
  ///   - title: The title of the video.
  ///   - fileType: The file type/extension of the video.
  ///   - videoId: A unique identifier for the video.
  ///   - collectionId: An optional identifier for the collection this video belongs to.
  ///   - libraryId: The identifier of the library where this video will be stored.
  ///   - expirationTime: The timestamp when the upload URL will expire. Defaults to 1 hour from creation.
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
  
  /// A string representation of the expiration time formatted as a whole number.
  ///
  /// This property is typically used when constructing API requests that require
  /// the expiration time as a string value.
  public var expirationTimeString: String {
    "\(String(format: "%.0f", expirationTime))"
  }
}
