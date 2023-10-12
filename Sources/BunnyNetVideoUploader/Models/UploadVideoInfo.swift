import Foundation

public struct UploadVideoInfo: Equatable, Hashable {
  public let uuid: UUID
  public let videoUUID: UUID
  public let info: VideoInfo
  
  public static func == (lhs: UploadVideoInfo, rhs: UploadVideoInfo) -> Bool {
    lhs.uuid == rhs.uuid && lhs.videoUUID == rhs.videoUUID
  }
}
