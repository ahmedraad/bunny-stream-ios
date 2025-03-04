import Foundation
import BunnyStreamSDK

struct HeatmapLoader {
  let bunnyStreamSDK: BunnyStreamSDK
  
  init(bunnyStreamSDK: BunnyStreamSDK) {
    self.bunnyStreamSDK = bunnyStreamSDK
  }
  
  func loadHeatmap(videoId: String, libraryId: Int, cdn: String) async throws -> Heatmap {
    let output = try await bunnyStreamSDK.Api.Video_GetVideoHeatmap(path: .init(libraryId: Int64(libraryId), videoId: videoId))
    switch output {
    case .ok(let okResponse):
      switch okResponse.body {
      case .json(let viewModel):
        let data = viewModel.heatmap?.additionalProperties ?? [:]
        var convertedDict = [Int: Int]()
        for (key, value) in data {
          if let intKey = Int(key) {
            convertedDict[intKey] = Int(value)
          }
        }
        
        return Heatmap(data: convertedDict)
      default:
        throw HeatmapLoaderError.notFound
      }
    case .notFound:
      throw HeatmapLoaderError.notFound
    default:
      throw HeatmapLoaderError.loadError
    }
  }
}

extension HeatmapLoader {
  enum HeatmapLoaderError: Error {
    case notFound
    case loadError
  }
}
