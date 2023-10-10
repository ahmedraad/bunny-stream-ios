import Foundation

public struct UploadProgress {
  public let bytesUploaded: Int
  public let totalBytes: Int
  
  public var fractionCompleted: Double {
    Double(bytesUploaded) / Double(totalBytes)
  }
}
