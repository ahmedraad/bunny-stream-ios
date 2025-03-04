import Foundation

#if os(iOS)
import GoogleInteractiveMediaAds

class MediaPlayerAdComponent: NSObject {
  private var adsLoader: IMAAdsLoader?
  private var adsManager: IMAAdsManager?
  private var adDisplayContainer: IMAAdDisplayContainer?
  private var contentPlayhead: IMAAVPlayerContentPlayhead?
  private var player: MediaPlayer
  private weak var viewController: UIViewController?
  var onAdPlaybackChanged: ((_ isPlaying: Bool) -> Void)?

  init(player: MediaPlayer) {
    self.player = player
    super.init()
    setupAdsLoader()
  }
  
  private func setupAdsLoader() {
    adsLoader = IMAAdsLoader(settings: nil)
    adsLoader?.delegate = self
    
    // Configure content playhead
    contentPlayhead = IMAAVPlayerContentPlayhead(avPlayer: player)
  }
  
  func setupAdsInController(_ controller: UIViewController) {
    self.viewController = controller
    // Ad container will be the view of AVPlayerViewController
    adDisplayContainer = IMAAdDisplayContainer(adContainer: controller.view, viewController: controller, companionSlots: nil)
  }
  
  func requestAds(adTagUrl: String) {
    guard let adDisplayContainer = adDisplayContainer else { return }
    let request = IMAAdsRequest(adTagUrl: adTagUrl, adDisplayContainer: adDisplayContainer, contentPlayhead: contentPlayhead, userContext: nil)
    adsLoader?.requestAds(with: request)
  }
  
  func destroy() {
    adsManager?.destroy()
  }
}

extension MediaPlayerAdComponent: IMAAdsLoaderDelegate {
  func adsLoader(_ loader: IMAAdsLoader, adsLoadedWith adsLoadedData: IMAAdsLoadedData) {
    adsManager = adsLoadedData.adsManager
    adsManager?.delegate = self
    adsManager?.initialize(with: nil)
  }
  
  func adsLoader(_ loader: IMAAdsLoader, failedWith adErrorData: IMAAdLoadingErrorData) {
    print(adErrorData.description)
  }
}

extension MediaPlayerAdComponent: IMAAdsManagerDelegate {
  func adsManager(_ adsManager: IMAAdsManager, didReceive event: IMAAdEvent) {
    if event.type == .LOADED {
      adsManager.start()
    } else if event.type == .STARTED {
      onAdPlaybackChanged?(true)
    } else if event.type == .SKIPPED || event.type == .COMPLETE {
      onAdPlaybackChanged?(false)
    } else if event.type == .TAPPED {
      adsManager.resume()
    }
  }
  
  func adsManager(_ adsManager: IMAAdsManager, didReceive error: IMAAdError) {
    print(error.description)
  }
  
  func adsManagerDidRequestContentPause(_ adsManager: IMAAdsManager) {
    // Pause content for ad playback
    player.pause()
  }
  
  func adsManagerDidRequestContentResume(_ adsManager: IMAAdsManager) {
    // Resume content after ad playback
    player.play()
  }
}
#elseif os(macOS)

class MediaPlayerAdComponent: NSObject {
  var onAdPlaybackChanged: ((_ isPlaying: Bool) -> Void)?
  
  init(player: MediaPlayer) {}
  
  func setupAdsInController(_ controller: ViewController) {}
  
  func requestAds(adTagUrl: String) {}
  
  func destroy() {}
}

#endif
