import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

public class BunnyNetClient {
  let accessKey: String
  let transport: ClientTransport
  
  public init(accessKey: String, transport: ClientTransport = URLSessionTransport()) {
    self.accessKey = accessKey
    self.transport = transport
  }
  
  public lazy var streamAPI = Client(serverURL: try! Servers.server1(),
                                     configuration: Configuration(dateTranscoder: CustomISO8601DateTranscoder()),
                                     transport: transport,
                                     middlewares: [AuthenticationMiddleware(accessKey: accessKey)])
}
