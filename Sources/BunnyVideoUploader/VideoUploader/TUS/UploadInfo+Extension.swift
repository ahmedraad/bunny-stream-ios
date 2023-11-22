import Foundation
import TUSKit

extension UploadInfo {
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

private extension String {
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

