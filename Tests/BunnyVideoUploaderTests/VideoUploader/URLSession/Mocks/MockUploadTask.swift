import Foundation
import BunnyVideoUploader

class MockUploadTask: UploadTaskProtocol {
  var taskDescription: String?
  var state: URLSessionTask.State = .suspended
  
  func resume() {
    state = .running
  }
  
  func suspend() {
    state = .suspended
  }
  
  func cancel() {
    state = .canceling
  }
}
