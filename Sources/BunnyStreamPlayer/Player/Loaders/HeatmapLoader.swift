import Foundation

struct HeatmapLoader {
  let accessKey: String
  
  private let baseURL = "https://video.bunnycdn.com"
  
  init(accessKey: String) {
    self.accessKey = accessKey
  }
  
  func loadHeatmap(videoId: String, libraryId: Int) async throws -> Heatmap {
    let urlString = "\(baseURL)/library/\(libraryId)/videos/\(videoId)/heatmap"
    
    guard let url = URL(string: urlString) else {
      throw HeatmapLoaderError.invalidURL
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue(accessKey, forHTTPHeaderField: "AccessKey")
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    
    let (data, response) = try await URLSession.shared.data(for: request)
    
    guard let httpResponse = response as? HTTPURLResponse else {
      throw HeatmapLoaderError.loadError
    }
    
    switch httpResponse.statusCode {
    case 200:
      let decoder = JSONDecoder()
      let heatmapResponse = try decoder.decode(HeatmapResponse.self, from: data)
      
      var convertedDict = [Int: Int]()
      for (key, value) in heatmapResponse.heatmap ?? [:] {
        if let intKey = Int(key) {
          convertedDict[intKey] = value
        }
      }
      
      return Heatmap(data: convertedDict)
    case 404:
      throw HeatmapLoaderError.notFound
    default:
      throw HeatmapLoaderError.loadError
    }
  }
}

extension HeatmapLoader {
  enum HeatmapLoaderError: Error {
    case invalidURL
    case notFound
    case loadError
  }
  
  struct HeatmapResponse: Decodable {
    let heatmap: [String: Int]?
  }
}

