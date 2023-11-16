import SwiftUI

public struct BunnyNetVideoPlayer: View {
  let videoLoader: VideoLoader
  let accessKey: String
  let videoId: String
  let libraryId: Int
  let cdn: String
  @State var player: MediaPlayer?
  @State private var loadingState: VideoLoadingState = .loading
  
  enum VideoLoadingState {
    case loading, loaded(MediaPlayer, Video), failed, loaderFailed(VideoLoader.VideoLoaderError)
  }
  
  public init(accessKey: String,
              videoId: String,
              libraryId: Int,
              cdn: String) {
    self.accessKey = accessKey
    self.videoId = videoId
    self.libraryId = libraryId
    self.cdn = cdn
    videoLoader = VideoLoader(bunnyNetClient: .init(accessKey: accessKey))
  }
  
  public var body: some View {
    VStack(alignment: .center) {
      switch loadingState {
      case .loading:
        ProgressView()
          .frame(maxWidth: .infinity, maxHeight: .infinity)
      case .loaded(let mediaPlayer, let video):
        BunnyNetVideoPlayerContainerView(player: mediaPlayer, video: video)
      case .failed:
        reloadButton()
      case .loaderFailed(let error):
        switch error {
        case .notFound:
          VStack(spacing: 8) {
            Image(systemName: "play.slash.fill")
              .resizable()
              .scaledToFill()
              .frame(width: 40, height: 40)
            Text("Video not found!")
              .font(.caption)
          }
        case .loadError:
          reloadButton()
        }
      }
    }
    .task {
      await loadVideo()
    }
    .onDisappear {
      player?.pause()
    }
  }
  
  @MainActor
  func loadVideo() async {
    loadingState = .loading
    do {
      let video = try await videoLoader.loadVideo(videoId: videoId, libraryId: libraryId, cdn: cdn)
      let player = MediaPlayer.make(video: video)
      self.player = player
      loadingState = .loaded(player, video)
    } catch let error as VideoLoader.VideoLoaderError {
      loadingState = .loaderFailed(error)
    } catch {
      loadingState = .failed
    }
  }
}

private extension BunnyNetVideoPlayer {
  func reloadButton() -> some View {
    Button {
      Task { await loadVideo() }
    } label: {
      Image(systemName: "arrow.counterclockwise.circle")
        .resizable()
        .scaledToFill()
        .frame(width: 40, height: 40)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}
