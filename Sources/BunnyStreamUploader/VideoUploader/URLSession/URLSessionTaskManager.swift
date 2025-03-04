import Foundation

class URLSessionTaskManager {
  private var uploadTasks: [UUID: UploadTaskProtocol] = [:]
  
  func addTask(for uuid: UUID, task: UploadTaskProtocol) {
    uploadTasks[uuid] = task
    task.resume()
  }
  
  func removeTask(for uuid: UUID) {
    cancelTask(for: uuid)
    uploadTasks.removeValue(forKey: uuid)
  }
  
  func suspendTask(for uuid: UUID) {
    uploadTasks[uuid]?.suspend()
  }
  
  func resumeTask(for uuid: UUID) {
    uploadTasks[uuid]?.resume()
  }
  
  func cancelTask(for uuid: UUID) {
    uploadTasks[uuid]?.cancel()
  }
}

protocol UploadTaskProtocol {
  func resume()
  func suspend()
  func cancel()
}

extension URLSessionUploadTask: UploadTaskProtocol { }
