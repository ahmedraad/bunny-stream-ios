import XCTest
@testable import BunnyNetVideoUploader

final class VideoRequestHeaderBuilderTests: XCTestCase {
  var headerBuilder: VideoRequestHeaderBuilder!
  
  override func setUp() {
    super.setUp()
    headerBuilder = VideoRequestHeaderBuilder()
  }
  
  override func tearDown() {
    headerBuilder = nil
    super.tearDown()
  }
  
  func testBuildHeaders() {
    // Given
    let videoId = "video123"
    let info = VideoInfo(content: .data(Data()),
                         title: "SampleVideo",
                         fileType: "video/quicktime",
                         videoId: videoId,
                         libraryId: 123123,
                         expirationTime: 123123123)
    let signature = "sampleSignature"
    
    // When
    let headers = headerBuilder.buildHeaders(for: info, signature: signature, videoId: videoId)
    
    // Then
    XCTAssertEqual(headers["AuthorizationSignature"], signature)
    XCTAssertEqual(headers["AuthorizationExpire"], "123123123")
    XCTAssertEqual(headers["VideoId"], "video123")
    XCTAssertEqual(headers["LibraryId"], "123123")
    let filenameBase64 = "SampleVideo".data(using: .utf8)?.base64EncodedString()
    let filetypeBase64 = "video/quicktime".data(using: .utf8)?.base64EncodedString()
    XCTAssertEqual(headers["Upload-Metadata"], "filename \(filenameBase64 ?? ""),filetype \(filetypeBase64 ?? "")")
  }
}
