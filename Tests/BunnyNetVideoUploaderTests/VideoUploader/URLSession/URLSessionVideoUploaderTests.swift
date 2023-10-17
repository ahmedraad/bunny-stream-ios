import XCTest
@testable import BunnyNetVideoUploader

final class URLSessionVideoUploaderTests: XCTestCase {
  var uploader: URLSessionVideoUploader!
  var mockSession: MockURLSession!
  var mockRequestBuilder: MockRequestBuilder!
  var taskManager: URLSessionTaskManager!
  var uploadTracker: UploadTracker!
  
  override func setUp() {
    super.setUp()
    mockSession = MockURLSession()
    mockRequestBuilder = MockRequestBuilder()
    taskManager = URLSessionTaskManager()
    uploadTracker = UploadTracker()
    uploader = URLSessionVideoUploader(uploadTracker: uploadTracker,
                                       requestBuilder: mockRequestBuilder,
                                       accessKey: "testKey",
                                       session: mockSession,
                                       taskManager: taskManager)
  }
  
  override func tearDown() {
    uploader = nil
    mockSession = nil
    mockRequestBuilder = nil
    taskManager = nil
    uploadTracker = nil
    super.tearDown()
  }
  
  func testUploadVideos() async {
    // Given
    let videoInfo = VideoInfo(content: .data(Data()),
                              title: "validVideoTitle",
                              fileType: "mp4",
                              videoId: "21c519be-d1f5-43cc-9a6e-c21b8927f237",
                              libraryId: 123123)
    let request = URLRequest(url: URL(string: "http://upload.com")!)
    mockRequestBuilder.nextRequest = request
    mockSession.nextDataTask = MockURLSessionDataTask()
    
    // When
    do {
      try await uploader.uploadVideos(with: [videoInfo])
    } catch {
      XCTFail("Expected success, but got error: \(error)")
    }
    
    // Then
    XCTAssertEqual(mockSession.nextDataTask.resumeCallCount, 1)
  }
  
  func testPauseUpload() {
    // Given
    let videoInfo = VideoInfo(content: .data(Data()),
                              title: "validVideoTitle",
                              fileType: "mp4",
                              videoId: "validVideoId",
                              libraryId: 123123)
    let uploadVideoInfo = UploadVideoInfo(uuid: UUID(), videoUUID: UUID(), info: videoInfo)
    uploadTracker.addUpload(info: uploadVideoInfo, status: .uploading(progress: .zero))
    
    // When
    uploader.pauseUpload(for: uploadVideoInfo)
    
    // Then
    XCTAssertEqual(uploadTracker.uploads[uploadVideoInfo], .paused(progress: .zero))
  }
  
  func testResumeUpload() {
    // Given
    let videoInfo = VideoInfo(content: .data(Data()),
                              title: "validVideoTitle",
                              fileType: "mp4",
                              videoId: "validVideoId",
                              libraryId: 123123)
    let uploadVideoInfo = UploadVideoInfo(uuid: UUID(), videoUUID: UUID(), info: videoInfo)
    uploadTracker.addUpload(info: uploadVideoInfo, status: .paused(progress: .zero))
    
    // When
    uploader.resumeUpload(for: uploadVideoInfo)
    
    // Then
    XCTAssertEqual(uploadTracker.uploads[uploadVideoInfo], .uploading(progress: .zero))
  }
  
  func testRemoveUpload() {
    // Given
    let videoInfo = VideoInfo(content: .data(Data()),
                              title: "validVideoTitle",
                              fileType: "mp4",
                              videoId: "validVideoId",
                              libraryId: 123123)
    let uploadVideoInfo = UploadVideoInfo(uuid: UUID(), videoUUID: UUID(), info: videoInfo)
    uploadTracker.addUpload(info: uploadVideoInfo, status: .uploading(progress: .zero))
    
    // When
    uploader.removeUpload(for: uploadVideoInfo)
    
    // Then
    XCTAssertNil(uploadTracker.uploads[uploadVideoInfo])
  }
}
