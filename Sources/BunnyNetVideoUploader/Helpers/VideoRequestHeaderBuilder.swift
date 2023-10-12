import Foundation

public struct VideoRequestHeaderBuilder {
  public typealias Headers = [String: String]
  
  public func buildHeaders(for info: VideoInfo,
                           signature: String,
                           videoId: String) -> Headers {
    let filenameBase64 = info.title.data(using: .utf8)?.base64EncodedString() ?? ""
    let filetypeBase64 = info.fileType.data(using: .utf8)?.base64EncodedString() ?? ""
    
    var headers: Headers = [
      "AuthorizationSignature": signature,
      "AuthorizationExpire": info.expirationTimeString,
      "VideoId": videoId,
      "LibraryId": "\(info.libraryId)",
      "Upload-Metadata": "filename \(filenameBase64),filetype \(filetypeBase64)"
    ]
    
    if let collectionId = info.collectionId {
      headers["collection"] = collectionId
    }
    
    return headers
  }
}
