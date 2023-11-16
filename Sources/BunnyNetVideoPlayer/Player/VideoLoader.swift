import Foundation
import BunnyNetClient

struct VideoLoader {
  let bunnyNetClient: BunnyNetClient
  
  init(bunnyNetClient: BunnyNetClient) {
    self.bunnyNetClient = bunnyNetClient
  }
  
  func loadVideo(videoId: String, libraryId: Int, cdn: String) async throws -> Video {
    let output = try await bunnyNetClient.streamAPI.Video_GetVideo(path: .init(libraryId: Int64(libraryId), videoId: videoId))
    switch output {
    case .ok(let okResponse):
      switch okResponse.body {
      case .json(let viewModel):
        let moments = viewModel.moments?.map { Moment(label: $0.label, second: UInt($0.timestamp))}
        let chapters = viewModel.chapters?.map { Chapter(start: Double($0.start), end: Double($0.end), type: .regular(title: $0.title)) }
        let captions = viewModel.captions?.compactMap { caption -> Caption? in
          guard let languageCode = caption.srclang, let label = caption.label else { return nil }
          return Caption(languageCode: languageCode, label: label)
        }
        
        return Video(guid: viewModel.guid ?? videoId,
                     chaptersList: ValidatedChapterList(originalChapters: chapters ?? [], duration: Double(viewModel.length)),
                     moments: moments ?? [],
                     thumbnailCount: Int(viewModel.thumbnailCount),
                     width: CGFloat(viewModel.width),
                     height: CGFloat(viewModel.height),
                     length: Double(viewModel.length),
                     cdn: cdn,
                     captions: captions ?? [],
                     libraryId: Int(viewModel.videoLibraryId),
                     tagUrl: Constants.testTagUrl) // TODO: change when api changes are ready
      default:
        throw VideoLoaderError.notFound
      }
    case .notFound:
      throw VideoLoaderError.notFound
    default:
      throw VideoLoaderError.loadError
    }
  }
}

extension VideoLoader {
  enum VideoLoaderError: Error {
    case notFound
    case loadError
  }
}
