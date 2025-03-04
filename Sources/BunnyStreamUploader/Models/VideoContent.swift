import Foundation

/// An enumeration representing the different ways video content can be provided for upload.
///
/// `VideoContent` supports two primary methods of providing video content:
/// - Direct binary data in memory
/// - A file URL pointing to the video file on disk
public enum VideoContent: Hashable {
  /// Video content provided as binary data in memory.
  ///
  /// - Parameter data: The video's binary data.
  case data(Data)
  
  /// Video content provided as a file URL.
  ///
  /// - Parameter url: The URL pointing to the video file on disk.
  case url(URL)
  
  /// The file extension of the video content, if available.
  ///
  /// This property attempts to determine the file extension from the content source:
  /// - For URL-based content, it returns the path extension
  /// - For data-based content, it returns nil as the format cannot be determined from the data alone
  var fileExtension: String? {
    switch self {
    case .data:
      return nil
    case .url(let url):
      return url.pathExtension
    }
  }
}
