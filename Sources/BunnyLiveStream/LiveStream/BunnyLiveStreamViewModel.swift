import SwiftUI

final class BunnyLiveStreamViewModel: ObservableObject {
  @Published var isLiveStreaming = false
  @Published var countdownProgress: CGFloat = 1.0
  @Published var state: StreamState = .notStreaming
  @Published var isMuted = false
  @Published var elapsedTime: String = "00:00:00"
}
