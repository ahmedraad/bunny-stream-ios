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
  @Published var videoInfos: [VideoResponseInfo] = []
  @Published var loadingState: LoadingState = .loading
  
  enum LoadingState {
    case loading, loaded, failed(String)
  }
  
  init(bunnyNetClient: BunnyNetClient) {
    self.bunnyNetClient = bunnyNetClient
  }
  
  func loadVideos(libraryId: Int64) async {
    do {
      loadingState = .loading
      let output = try await bunnyNetClient.streamAPI.Video_List(path: .init(libraryId: libraryId))
      handle(output: output)
    } catch {
      loadingState = .failed(error.localizedDescription)
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
        loadingState = .loaded
      default:
        loadingState = .failed("No items!")
      }
    case .undocumented(statusCode: let statusCode, _):
      loadingState = .failed("🥺 undocumented response: \(statusCode)")
    case .unauthorized:
      loadingState = .failed("Unauthorized")
    case .internalServerError(_):
      loadingState = .failed("Internal Server Error")
    }
  }
}
