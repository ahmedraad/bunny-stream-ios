import Foundation

public protocol URLSessionProtocol {
  func customUploadTask(with request: URLRequest, fromFile url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> UploadTaskProtocol
  func customUploadTask(with request: URLRequest, from bodyData: Data, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> UploadTaskProtocol
}

extension URLSession: URLSessionProtocol {
  public func customUploadTask(with request: URLRequest, fromFile url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> UploadTaskProtocol {
    uploadTask(with: request, fromFile: url, completionHandler: completionHandler)
  }
  
  public func customUploadTask(with request: URLRequest, from bodyData: Data, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> UploadTaskProtocol {
    uploadTask(with: request, from: bodyData, completionHandler: completionHandler)
  }
}
