import XCTest
@testable import BunnyNetVideoUploader

final class VideoSHA256SignerTests: XCTestCase {
  var videoSHA256Signer: VideoSHA256Signer!
  
  override func setUp() {
    super.setUp()
    videoSHA256Signer = VideoSHA256Signer()
  }
  
  override func tearDown() {
    videoSHA256Signer = nil
    super.tearDown()
  }
  
  func testGenerateSignature() {
    // Given
    let info = VideoInfo(content: .data(Data()),
                         title: "title",
                         fileType: "mpeg4",
                         videoId: "123",
                         libraryId: 12312,
                         expirationTime: 1696971042)
    let apiKey = "testApiKey"
    
    // When
    let signature = videoSHA256Signer.sign(info: info, apiKey: apiKey)
    
    // Then
    let expectedSignature = "384dca7be9469534e1ac9883e9eaeebdbb23fb92dad1186009e07ff3a4d31186"
    XCTAssertEqual(signature, expectedSignature, "Generated signature does not match expected value.")
  }
  
  func testGenerateSignatureWithEmptyValues() {
    // Given
    let info = VideoInfo(content: .data(Data()),
                         title: "title",
                         fileType: "mpeg4",
                         videoId: "123",
                         libraryId: 12312,
                         expirationTime: 1696971042)
    let apiKey = ""
    
    // When
    let signature = videoSHA256Signer.sign(info: info, apiKey: apiKey)
    
    // Then
    let expectedSignature = "88e83f35155e63a87b12ac0f6370f76abd23ec1aa9af961fa64a1234c958b2b0"
    XCTAssertEqual(signature, expectedSignature, "Generated signature does not match expected value for empty inputs.")
  }
}
