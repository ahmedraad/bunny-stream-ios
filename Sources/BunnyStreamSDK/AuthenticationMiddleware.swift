import OpenAPIRuntime
import OpenAPIURLSession
import Foundation
import HTTPTypes

struct AuthenticationMiddleware: ClientMiddleware {
  var accessKey: String
  
  func intercept(
    _ request: HTTPRequest,
    body: HTTPBody?,
    baseURL: URL,
    operationID: String,
    next: (HTTPRequest, HTTPBody?, URL) async throws -> (HTTPResponse, HTTPBody?)
  ) async throws -> (HTTPResponse, HTTPBody?) {
    var request = request
    if let key = HTTPField.Name.accessKey {
      request.headerFields[key] = accessKey
    }
    
    return try await next(request, body, baseURL)
  }
}

extension HTTPField.Name {
  static var accessKey: Self? { HTTPField.Name("AccessKey") }
}
