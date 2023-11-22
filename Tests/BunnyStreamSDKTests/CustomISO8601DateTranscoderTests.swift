import XCTest
@testable import BunnyStreamSDK

class CustomISO8601DateTranscoderTests: XCTestCase {
  var dateTranscoder: CustomISO8601DateTranscoder!
  
  override func setUp() {
    super.setUp()
    dateTranscoder = CustomISO8601DateTranscoder()
  }
  
  override func tearDown() {
    dateTranscoder = nil
    super.tearDown()
  }
  
  func testEncodingDate() {
    // Given
    let testDate = Date(timeIntervalSince1970: 1_580_828_001) // "2020-02-20T10:00:01.000Z" in UTC
    let expectedString = "2020-02-04T14:53:21.000"
    
    // When
    let encodedString = try? dateTranscoder.encode(testDate)
    
    // Then
    XCTAssertEqual(encodedString, expectedString)
  }
  
  func testDecodingDate() {
    // Given
    let dateString = "2020-02-04T14:53:21.000"
    let expectedDate = Date(timeIntervalSince1970: 1_580_828_001)
    
    // When
    let decodedDate = try? dateTranscoder.decode(dateString)
    
    // Then
    XCTAssertEqual(decodedDate, expectedDate)
  }
  
  func testDecodingInvalidDateString() {
    // Given
    let invalidDateString = "2020-02-20 10:00:01"
    
    // When
    var decodingError: Error?
    do {
      _ = try dateTranscoder.decode(invalidDateString)
    } catch let error {
      decodingError = error
    }
    
    // Then
    XCTAssertNotNil(decodingError)
    if let decodingError = decodingError as? DecodingError {
      switch decodingError {
      case .dataCorrupted(let context):
        XCTAssertEqual(context.debugDescription,
                       "Expected date string to be in either of the formats: yyyy-MM-dd'T'HH:mm:ss.SSS or yyyy-MM-dd'T'HH:mm:ss.SSSSSSS'Z'")
      default:
        XCTFail("Unexpected decoding error type.")
      }
    } else {
      XCTFail("Error is not of type DecodingError.")
    }
  }
}

