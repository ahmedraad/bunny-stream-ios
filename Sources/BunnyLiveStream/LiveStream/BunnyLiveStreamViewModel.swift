import SwiftUI

final class BunnyLiveStreamViewModel: ObservableObject {
  @Published var isLiveStreaming = false
  @Published var isMuted = false
}
