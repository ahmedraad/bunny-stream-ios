import XCTest
@testable import BunnyNetVideoUploader

final class URLSessionRequestBuilderTests: XCTestCase {
  var requestBuilder: URLSessionRequestBuilder!
  
  override func setUp() {
    super.setUp()
    requestBuilder = URLSessionRequestBuilder()
  }
  
  override func tearDown() {
    requestBuilder = nil
    super.tearDown()
  }
  
  func testValidRequestCreation() {
    let videoInfo = VideoInfo(content: .data(Data()),
                              title: "validVideoTitle",
                              fileType: "mp4",
                              videoId: "validVideoId",
                              libraryId: 123123)
    let accessKey = "sampleAccessKey"
    
    guard let request = requestBuilder.createRequest(for: videoInfo, with: accessKey) else {
      XCTFail("Request should not be nil")
      return
    }
    
    // Validate URL
    XCTAssertEqual(request.url?.absoluteString, "https://video.bunnycdn.com/library/123123/videos/validVideoId")
    
    // Validate headers
    XCTAssertEqual(request.allHTTPHeaderFields?["AccessKey"], accessKey)
    XCTAssertEqual(request.allHTTPHeaderFields?["Content-Type"], "application/octet-stream")
    
    // Validate HTTP method
    XCTAssertEqual(request.httpMethod, "PUT")
  }
  
  func testInvalidRequestCreation() {
    let videoInfo = VideoInfo(content: .data(Data()),
                              title: "###",
                              fileType: "###",
                              videoId: "####",
                              libraryId: 123123)
    let accessKey = "sampleAccessKey"
    
    let request = requestBuilder.createRequest(for: videoInfo, with: accessKey)
    XCTAssertNil(request, "Request should be nil for invalid VideoInfo data")
  }
}
