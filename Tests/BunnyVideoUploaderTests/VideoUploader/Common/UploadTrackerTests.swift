import XCTest
@testable import BunnyVideoUploader

final class UploadTrackerTests: XCTestCase {
  var tracker: UploadTracker!
  var mockDelegate: MockUploadTrackerDelegate!
  
  override func setUp() {
    super.setUp()
    tracker = UploadTracker()
    mockDelegate = MockUploadTrackerDelegate()
    tracker.delegate = mockDelegate
  }
  
  override func tearDown() {
    tracker = nil
    mockDelegate = nil
    super.tearDown()
  }
  
  func testAddUpload() {
    let videoInfo = VideoInfo(content: .data(Data()),
                              title: "validVideoTitle",
                              fileType: "mp4",
                              videoId: "validVideoId",
                              libraryId: 123123)
    let uploadVideoInfo = UploadVideoInfo(uuid: UUID(), videoUUID: UUID(), info: videoInfo)
    tracker.addUpload(info: uploadVideoInfo, status: .uploading(progress: .zero))
    
    XCTAssertNotNil(tracker.uploads[uploadVideoInfo])
  }
  
  func testPauseUpload() {
    let videoInfo = VideoInfo(content: .data(Data()),
                              title: "validVideoTitle",
                              fileType: "mp4",
                              videoId: "validVideoId",
                              libraryId: 123123)
    let uploadVideoInfo = UploadVideoInfo(uuid: UUID(), videoUUID: UUID(), info: videoInfo)
    tracker.addUpload(info: uploadVideoInfo, status: .uploading(progress: .zero))
    tracker.pauseUpload(id: uploadVideoInfo.uuid)
    
    XCTAssertEqual(tracker.uploads[uploadVideoInfo], .paused(progress: .zero))
  }
  
  func testResumeUpload() {
    // Given
    let videoInfo = VideoInfo(content: .data(Data()),
                              title: "validVideoTitle",
                              fileType: "mp4",
                              videoId: "validVideoId",
                              libraryId: 123123)
    let uploadVideoInfo = UploadVideoInfo(uuid: UUID(), videoUUID: UUID(), info: videoInfo)
    let progress = UploadProgress(bytesUploaded: 50, totalBytes: 100)
    tracker.addUpload(info: uploadVideoInfo, status: .paused(progress: progress))
    
    // When
    tracker.resumeUpload(id: uploadVideoInfo.uuid)
    
    // Then
    XCTAssertEqual(mockDelegate.lastUpdatedInfo, uploadVideoInfo)
    XCTAssertEqual(mockDelegate.lastUpdatedStatus, .uploading(progress: progress))
  }
  
  func testRemoveUpload() {
    // Given
    let videoInfo = VideoInfo(content: .data(Data()),
                              title: "validVideoTitle",
                              fileType: "mp4",
                              videoId: "validVideoId",
                              libraryId: 123123)
    let uploadVideoInfo = UploadVideoInfo(uuid: UUID(), videoUUID: UUID(), info: videoInfo)
    tracker.addUpload(info: uploadVideoInfo, status: .uploading(progress: UploadProgress(bytesUploaded: 50, totalBytes: 100)))
    
    // When
    tracker.removeUpload(id: uploadVideoInfo.uuid)
    
    // Then
    XCTAssertEqual(mockDelegate.lastUpdatedInfo, uploadVideoInfo)
    XCTAssertEqual(mockDelegate.lastUpdatedStatus, .removed)
  }
  
  func testAddOrUpdateUpload() {
    // Given
    let videoInfo = VideoInfo(content: .data(Data()),
                              title: "validVideoTitle",
                              fileType: "mp4",
                              videoId: "validVideoId",
                              libraryId: 123123)
    let uploadVideoInfo = UploadVideoInfo(uuid: UUID(), videoUUID: UUID(), info: videoInfo)
    
    // When
    let status = UploadStatus.uploaded(url: URL(string: "http://uploaded.com")!)
    tracker.addUpload(info: uploadVideoInfo, status: .uploading(progress: .zero))
    tracker.addOrUpdateUpload(id: uploadVideoInfo.uuid, status: status)
    
    // Then
    XCTAssertEqual(mockDelegate.lastUpdatedInfo, uploadVideoInfo)
    XCTAssertEqual(mockDelegate.lastUpdatedStatus, status)
  }
  
  class MockUploadTrackerDelegate: UploadTrackerDelegate {
    var lastUpdatedInfo: UploadVideoInfo?
    var lastUpdatedStatus: UploadStatus?
    
    func uploadTracker(_ tracker: UploadTracker, didUpdateUploadWithInfo info: UploadVideoInfo, toStatus status: UploadStatus) {
      lastUpdatedInfo = info
      lastUpdatedStatus = status
    }
  }
}
