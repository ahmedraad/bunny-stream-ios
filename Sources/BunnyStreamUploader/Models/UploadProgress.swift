import Foundation

/// A structure that represents the progress of a video upload.
///
/// `UploadProgress` tracks the number of bytes uploaded and the total size of the upload,
/// providing a way to calculate the completion percentage of the upload.
public struct UploadProgress: Equatable {
  /// The number of bytes that have been successfully uploaded.
  public let bytesUploaded: Int
  
  /// The total number of bytes to be uploaded.
  public let totalBytes: Int
  
  /// The fraction of the upload that has been completed, represented as a value between 0 and 1.
  ///
  /// This property calculates the progress as a ratio of uploaded bytes to total bytes.
  /// For example, a value of 0.5 indicates that 50% of the upload is complete.
  public var fractionCompleted: Double {
    Double(bytesUploaded) / Double(totalBytes)
  }
  
  /// A progress object representing no progress (0 bytes uploaded out of 0 total bytes).
  ///
  /// This is typically used as an initial value or to reset progress tracking.
  public static var zero: UploadProgress {
    .init(bytesUploaded: .zero, totalBytes: .zero)
  }
}
