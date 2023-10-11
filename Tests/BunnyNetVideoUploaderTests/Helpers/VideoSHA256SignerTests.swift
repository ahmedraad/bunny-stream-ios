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
    let info = VideoInfo(content: .data(Data()), title: "title", libraryId: 12312, expirationTime: 1696971042)
    let apiKey = "testApiKey"
    let videoId = "testVideoId"
    
    // When
    let signature = videoSHA256Signer.sign(info: info, apiKey: apiKey, videoId: videoId)
    
    // Then
    let expectedSignature = "877c7b5010b795f4daacc4ba26166aebd9ea04c387cfd67757291426332032d8"
    XCTAssertEqual(signature, expectedSignature, "Generated signature does not match expected value.")
  }
  
  func testGenerateSignatureWithEmptyValues() {
    // Given
    let info = VideoInfo(content: .data(Data()), title: "title", libraryId: 12312, expirationTime: 1696971042)
    let apiKey = ""
    let videoId = ""
    
    // When
    let signature = videoSHA256Signer.sign(info: info, apiKey: apiKey, videoId: videoId)
    
    // Then
    let expectedSignature = "99343598819b8f5108e1a8af918f63d118c453841a299d3656a4d3517c77c7d0"
    XCTAssertEqual(signature, expectedSignature, "Generated signature does not match expected value for empty inputs.")
  }
}
