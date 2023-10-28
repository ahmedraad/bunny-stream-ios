//
//  StreamAPIDemoViewModel.swift
//  Example-App
//
//  Created by Egzon Arifi on 06/10/2023.
//

import Foundation
import BunnyNetClient

@MainActor
class StreamAPIDemoViewModel: ObservableObject {
  let bunnyNetClient: BunnyNetClient
  @Published var description: String?
  @Published var videoInfos: [(title: String?, url: URL?)] = []
  
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
        videoInfos = items.map { ($0.title, URL.makeVideoURL(libraryId: Int($0.videoLibraryId), videoId: $0.guid ?? "")) }
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
