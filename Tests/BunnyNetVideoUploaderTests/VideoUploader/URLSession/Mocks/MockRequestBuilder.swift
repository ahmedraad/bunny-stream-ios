import Foundation
import BunnyNetVideoUploader

class MockRequestBuilder: RequestBuilder {
  var nextRequest: URLRequest?
  
  func createRequest(for info: VideoInfo, with accessKey: String) -> URLRequest? {
    nextRequest
  }
}
