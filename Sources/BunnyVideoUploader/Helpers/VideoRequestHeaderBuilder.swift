import Foundation

struct VideoRequestHeaderBuilder {
  func buildHeaders(for info: VideoInfo, signature: String) -> Headers {
    let filenameBase64 = info.title.data(using: .utf8)?.base64EncodedString() ?? ""
    let filetypeBase64 = info.fileType.data(using: .utf8)?.base64EncodedString() ?? ""
    
    var headers: Headers = [
      "AuthorizationSignature": signature,
      "AuthorizationExpire": info.expirationTimeString,
      "VideoId": info.videoId,
      "LibraryId": "\(info.libraryId)",
      "Upload-Metadata": "filename \(filenameBase64),filetype \(filetypeBase64)"
    ]
    
    if let collectionId = info.collectionId {
      headers["collection"] = collectionId
    }
    
    return headers
  }
}
