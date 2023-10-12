import Foundation

public struct UploadProgress {
  public let bytesUploaded: Int
  public let totalBytes: Int
  
  public var fractionCompleted: Double {
    Double(bytesUploaded) / Double(totalBytes)
  }
  
  public static var zero: UploadProgress {
    .init(bytesUploaded: .zero, totalBytes: .zero)
  }
}
