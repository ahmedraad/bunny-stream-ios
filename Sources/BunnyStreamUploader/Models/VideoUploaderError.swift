import Foundation

/// An enumeration of errors that can occur during video upload operations.
///
/// `VideoUploaderError` implements `LocalizedError` to provide human-readable error messages
/// for various failure scenarios that may occur during the video upload process.
public enum VideoUploaderError: LocalizedError {
  /// Indicates a failure to create a video with a specific error message.
  ///
  /// - Parameter message: A detailed message explaining why the video creation failed.
  case failedToCreateVideoWithReason(message: String)
  
  /// Indicates a general failure in creating a video without a specific reason.
  case failedToCreateVideo
  
  /// Indicates a failure during the video upload process.
  case failedToUploadVideo
  
  /// Indicates a failure in creating the network request for the upload.
  case failedToCreateRequest
  
  /// Indicates a failure in creating the upload task.
  case failedToCreateUploadTask
  
  /// Indicates that the provided video UUID is invalid.
  case invalidVideoUUID
  
  /// A localized description of the error suitable for displaying to users.
  ///
  /// This property provides human-readable error messages that can be displayed
  /// in the user interface or logged for debugging purposes.
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
