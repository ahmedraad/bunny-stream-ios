import Foundation
import BunnyVideoUploader

class MockURLSession: URLSessionProtocol {
  var nextDataTask: MockURLSessionDataTask = MockURLSessionDataTask()
  var nextError: Error?
  
  func customUploadTask(with request: URLRequest, fromFile url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> BunnyVideoUploader.UploadTaskProtocol {
    return nextDataTask
  }
  
  func customUploadTask(with request: URLRequest, from bodyData: Data, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> BunnyVideoUploader.UploadTaskProtocol {
    return nextDataTask
  }
}

class MockURLSessionDataTask: UploadTaskProtocol {
  private(set) var resumeCallCount = 0
  private(set) var suspendCallCount = 0
  private(set) var cancelCallCount = 0

  func suspend() {
    suspendCallCount += 1
  }
  
  func cancel() {
    cancelCallCount += 1
  }
  
  func resume() {
    resumeCallCount += 1
  }
}
