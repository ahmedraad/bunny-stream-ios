//
//  VideoListViewModel.swift
//  Example-App
//
//  Created by Egzon Arifi on 06/10/2023.
//

import Foundation
import BunnyNetClient

@MainActor
class VideoListViewModel: ObservableObject {
  let bunnyNetClient: BunnyNetClient
  @Published var description: String?
  @Published var videoInfos: [VideoResponseInfo] = []
  
  init(bunnyNetClient: BunnyNetClient, description: String? = nil) {
    self.bunnyNetClient = bunnyNetClient
    self.description = description
  }
  
  func loadVideos(libraryId: Int64) async {
    do {
      let output = try await bunnyNetClient.streamAPI.Video_List(path: .init(libraryId: libraryId))
      handle(output: output)
    } catch {
      description = error.localizedDescription
    }
  }
  
  private func handle(output: Operations.Video_List.Output) {
    switch output {
    case .ok(let okResponse):
      switch okResponse.body {
      case .json(let viewModel):
        guard let items = viewModel.items else { return }
        videoInfos = items.map {
          VideoResponseInfo(id: $0.guid ?? "",
                            title: $0.title,
                            thumbnailCount: $0.thumbnailCount,
                            width: Float($0.width),
                            height: Float($0.height),
                            length: $0.length,
                            libraryId: $0.videoLibraryId,
                            encodeProgress: $0.encodeProgress,
                            storageSize: Double($0.storageSize),
                            thumbnailFileName: $0.thumbnailFileName,
                            averageWatchTime: $0.averageWatchTime,
                            views: Int($0.views))
        }
      default:
        break
      }
      description = nil
    case .undocumented(statusCode: let statusCode, _):
      description = "🥺 undocumented response: \(statusCode)"
    case .unauthorized:
      description = "Unauthorized"
    case .internalServerError(_):
      description = "Internal Server Error"
    }
  }
}
