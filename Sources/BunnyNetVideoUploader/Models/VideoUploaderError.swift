import Foundation

public enum VideoUploaderError: LocalizedError {
  case failedToCreateVideoWithReason(message: String)
  case failedToCreateVideo
  case failedToUploadVideo
  
  
  public var errorDescription: String? {
    switch self {
    case .failedToCreateVideoWithReason(let message):
      return "An error occurred while creating the video! \nReason: \(message)"
    case .failedToCreateVideo:
      return "An error occurred while creating the video!"
    case .failedToUploadVideo:
      return "Failed to upload the video!"
    }
  }
}
