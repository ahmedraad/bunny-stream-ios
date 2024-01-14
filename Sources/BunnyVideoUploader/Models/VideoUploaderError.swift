import Foundation

public enum VideoUploaderError: LocalizedError {
  case failedToCreateVideoWithReason(message: String)
  case failedToCreateVideo
  case failedToUploadVideo
  case failedToCreateRequest
  case failedToCreateUploadTask
  case invalidVideoUUID
  
  public var errorDescription: String? {
    switch self {
    case .failedToCreateVideoWithReason(let message):
      return "An error occurred while creating the video! \nReason: \(message)"
    case .failedToCreateVideo:
      return "An error occurred while creating the video!"
    case .failedToUploadVideo:
      return "Failed to upload the video!"
    case .failedToCreateRequest:
      return "There is an issue to create the request!"
    case .failedToCreateUploadTask:
      return "There is an issue to initiate the request!"
    case .invalidVideoUUID:
      return "The video id is invalid!"
    }
  }
}
