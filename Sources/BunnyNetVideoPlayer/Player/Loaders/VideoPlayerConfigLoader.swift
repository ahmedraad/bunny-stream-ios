import Foundation
import SwiftUI

struct VideoPlayerConfigLoader {
  // TODO: Refactor this to use new endpoint for video info
  func load(libraryId: Int) async throws -> VideoConfigResponse {
    let url = URL(string: "https://api.bunny.net/videolibrary/\(libraryId)")!
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    request.addValue(token, forHTTPHeaderField: "Authorization")
    
    let (data, _) = try await URLSession.shared.data(for: request)
    let config = try JSONDecoder().decode(VideoConfigResponse.self, from: data)
    
    return config
  }
}

// TODO: Remove this when new endpoint for video info is ready
let token = """
token
"""
