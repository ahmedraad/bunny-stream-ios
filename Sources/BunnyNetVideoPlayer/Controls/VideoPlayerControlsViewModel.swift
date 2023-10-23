import Combine
import AVKit
import SwiftUI

class VideoPlayerViewModel: ObservableObject {
  @Published var player: AVPlayer
  
  @Published var isFullScreen: Bool = false
  @Published var isMuted: Bool = false
  @Published var isPlaying: Bool = false
  @Published var currentTime: CMTime = CMTime(seconds: 0, preferredTimescale: 1)
  @Published var totalTime: CMTime = CMTime(seconds: 1, preferredTimescale: 1)
  @Published var sliderValue: Double = 0.0
  
  private var cancellables: Set<AnyCancellable> = []
  private var ratePublisher: AnyPublisher<Float, Never> {
    player.publisher(for: \.rate).eraseToAnyPublisher()
  }
  
  private var durationPublisher: AnyPublisher<CMTime, Never> {
    player.currentItem?.publisher(for: \.duration).eraseToAnyPublisher() ?? Just(CMTime(seconds: 0, preferredTimescale: 1)).eraseToAnyPublisher()
  }
  
  init(player: AVPlayer) {
    self.player = player
  }
}

extension VideoPlayerViewModel {
  var currentFormattedTime: String {
    "\(secondsToTime(Int(currentTime.seconds)))"
  }
  
  var totalFormattedTime: String {
    "\(secondsToTime(Int(totalTime.seconds)))"
  }
  
  func setupPlayer() {
    ratePublisher
      .sink { newRate in
        self.isPlaying = newRate != 0
      }
      .store(in: &cancellables)
    
    durationPublisher
      .sink { newDuration in
        self.totalTime = newDuration
      }
      .store(in: &cancellables)
    
    player.addPeriodicTimeObserver(forInterval: CMTimeMakeWithSeconds(0.5, preferredTimescale: 600),
                                   queue: DispatchQueue.main) { time in
      self.currentTime = time
    }
  }
  
  func togglePlayPause() {
    if isPlaying {
      player.pause()
    } else {
      player.play()
    }
  }
  
  func skipBackward() {
    let currentTime = player.currentTime()
    let newTime = CMTimeSubtract(currentTime, CMTime(seconds: 10, preferredTimescale: 600))
    player.seek(to: newTime)
  }
  
  func skipForward() {
    let currentTime = player.currentTime()
    let newTime = CMTimeAdd(currentTime, CMTime(seconds: 10, preferredTimescale: 600))
    player.seek(to: newTime)
  }
  
  func toggleFullScreenMode() {
    withAnimation {
      isFullScreen.toggle()
    }
  }
  
  func toggleMute() {
    isMuted.toggle()
    player.isMuted = isMuted
  }
  
  func optionsAction() { }
  
  func airplayAction() { }
}

private extension VideoPlayerViewModel {
  func secondsToTime(_ seconds: Int) -> String {
    let hours = seconds / 3600
    let minutes = (seconds % 3600) / 60
    let seconds = seconds % 60
    
    if hours > 0 {
      return String(format: "%d:%02d:%02d", hours, minutes, seconds)
    } else {
      return String(format: "%d:%02d", minutes, seconds)
    }
  }
}
