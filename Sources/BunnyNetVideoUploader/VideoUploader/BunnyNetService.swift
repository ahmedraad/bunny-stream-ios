import Foundation
import BunnyNetClient

final class BunnyNetService {
  private let bunnyNetClient: BunnyNetClient
  
  init(bunnyNetClient: BunnyNetClient) {
    self.bunnyNetClient = bunnyNetClient
  }
  
  func createVideo(title: String, libraryId: Int) async throws -> String? {
    let output = try await bunnyNetClient.streamAPI.Video_CreateVideo(path: .init(libraryId: Int64(libraryId)),
                                                                      body: .json(.init(title: title)))
    switch output {
    case .ok(let okResponse):
      if case .json(let viewModel) = okResponse.body {
        return viewModel.guid
      }
    case .unauthorized:
      throw VideoUploaderError.failedToCreateVideoWithReason(message: "Not authorized to create videos in this library!")
    default:
      throw VideoUploaderError.failedToCreateVideo
    }
    return nil
  }
  
  func deleteVideo(_ videoId: String, libraryId: Int) async throws {
    _ = try await bunnyNetClient.streamAPI.Video_DeleteVideo(path: .init(libraryId: Int64(libraryId),
                                                                         videoId: videoId.lowercased()))
  }
}
