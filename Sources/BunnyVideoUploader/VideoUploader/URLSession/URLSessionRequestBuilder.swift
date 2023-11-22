import Foundation

public protocol RequestBuilder {
  func createRequest(for info: VideoInfo, with accessKey: String) -> URLRequest?
}

public struct URLSessionRequestBuilder: RequestBuilder {
  public func createRequest(for info: VideoInfo, with accessKey: String) -> URLRequest? {
    let urlString = "https://video.bunnycdn.com/library/\(info.libraryId)/videos/\(info.videoId)"
    guard let url = URL(string: urlString) else { return nil }
    
    var request = URLRequest(url: url)
    request.allHTTPHeaderFields = [
      "AccessKey": accessKey,
      "Content-Type": "application/octet-stream"
    ]
    request.httpMethod = "PUT"
    return request
  }
}
