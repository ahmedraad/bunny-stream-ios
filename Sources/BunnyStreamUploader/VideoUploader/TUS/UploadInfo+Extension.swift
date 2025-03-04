import Foundation
import TUSKit

/// Extension to convert TUSKit's UploadInfo to the application's UploadVideoInfo.
extension UploadInfo {
  /// Converts a TUSKit upload info object to an application-specific upload video info object.
  ///
  /// This method extracts relevant information from the TUS upload headers and metadata
  /// to reconstruct an `UploadVideoInfo` object that can be used by the application.
  /// The conversion process:
  /// 1. Extracts and validates the video UUID and library ID from headers
  /// 2. Creates a URL-based video content object using the file path
  /// 3. Extracts the filename from base64-encoded metadata
  /// 4. Constructs the video info with available data
  ///
  /// - Returns: An `UploadVideoInfo` object if all required information is available,
  ///           nil if any required field is missing or invalid.
  func toUploadVideoInfo() -> UploadVideoInfo? {
    guard let videoUUIDString = customHeaders?["VideoId"],
          let videoUUID = UUID(uuidString: videoUUIDString),
          let libraryIdString = customHeaders?["LibraryId"],
          let libraryId = Int(libraryIdString) else {
      return nil
    }

    let videoContent = VideoContent.url(filePath)
    let title = customHeaders?["Upload-Metadata"]?.extractFilenameFromMetadata() ?? "Untitled"

    let videoInfo = VideoInfo(content: videoContent,
                              title: title,
                              fileType: mimeType ?? "mpeg4",
                              videoId: videoUUIDString,
                              collectionId: nil,
                              libraryId: libraryId)

    return UploadVideoInfo(uuid: self.id, videoUUID: videoUUID, info: videoInfo)
  }
}

/// Extension to handle base64-encoded metadata in TUS upload headers.
private extension String {
  /// Extracts and decodes a filename from TUS upload metadata.
  ///
  /// This method parses the Upload-Metadata header format used by TUS, which
  /// contains base64-encoded key-value pairs. It specifically looks for and
  /// decodes the 'filename' field.
  ///
  /// The metadata format is expected to be:
  /// `key1 base64value1,key2 base64value2,...`
  ///
  /// - Returns: The decoded filename if found and successfully decoded, nil otherwise.
  func extractFilenameFromMetadata() -> String? {
    let components = self.split(separator: ",")
    for component in components {
      if component.hasPrefix("filename ") {
        let encodedFilename = String(component.split(separator: " ")[1])
        if let data = Data(base64Encoded: encodedFilename),
           let decodedString = String(data: data, encoding: .utf8) {
          return decodedString
        }
      }
    }
    return nil
  }
}
