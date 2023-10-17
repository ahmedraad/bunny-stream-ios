import XCTest
@testable import BunnyNetVideoUploader

final class URLSessionTaskManagerTests: XCTestCase {
  var taskManager: URLSessionTaskManager!
  
  override func setUp() {
    super.setUp()
    taskManager = URLSessionTaskManager()
  }
  
  override func tearDown() {
    taskManager = nil
    super.tearDown()
  }
  
  func testAddTask() {
    let mockTask = MockUploadTask()
    let uuid = UUID()
    taskManager.addTask(for: uuid, task: mockTask)
    XCTAssertEqual(mockTask.state, .running)
  }
  
  func testRemoveTask() {
    let mockTask = MockUploadTask()
    let uuid = UUID()
    taskManager.addTask(for: uuid, task: mockTask)
    taskManager.removeTask(for: uuid)
    XCTAssertEqual(mockTask.state, .canceling)
  }
  
  func testSuspendTask() {
    let mockTask = MockUploadTask()
    let uuid = UUID()
    taskManager.addTask(for: uuid, task: mockTask)
    taskManager.suspendTask(for: uuid)
    XCTAssertEqual(mockTask.state, .suspended)
  }
  
  func testResumeTask() {
    let mockTask = MockUploadTask()
    let uuid = UUID()
    taskManager.addTask(for: uuid, task: mockTask)
    taskManager.suspendTask(for: uuid)
    taskManager.resumeTask(for: uuid)
    XCTAssertEqual(mockTask.state, .running)
  }
}
