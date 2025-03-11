import XCTest
import OpenAPIRuntime
import OpenAPIURLSession
import HTTPTypes

@testable import BunnyStreamAPI

class AuthenticationMiddlewareTests: XCTestCase {
  var middleware: AuthenticationMiddleware!
  
  override func setUp() {
    super.setUp()
    middleware = AuthenticationMiddleware(accessKey: "TestAccessKey")
  }
  
  override func tearDown() {
    middleware = nil
    super.tearDown()
  }
  
  func testMiddlewareAddsAccessKey() async throws {
    // Given
    let request = HTTPRequest(method: .get, scheme: "https", authority: nil, path: nil)
    let expectedKey = "TestAccessKey"
    
    let next: (HTTPRequest, HTTPBody?, URL) async throws -> (HTTPResponse, HTTPBody?) = { req, _, _ in
      let keyInHeader = req.headerFields[HTTPField.Name.accessKey!]
      // Then
      XCTAssertEqual(keyInHeader, expectedKey)
      return (HTTPResponse(status: .accepted), nil)
    }
    
    // When
    _ = try await middleware.intercept(request, body: nil, baseURL: URL(string: "https://example.com")!, operationID: "TestOperation", next: next)
  }
}
