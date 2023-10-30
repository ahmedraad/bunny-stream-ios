import SwiftUI
import AVKit

extension MediaPlayer {
  
  func generateThumbnail(at seconds: Double) async -> (image: Image?, size: CGSize) {
    guard let asset = self.currentItem?.asset else { return (image: nil, size: .zero) }
    let assetIG = AVAssetImageGenerator(asset: asset)
    
    assetIG.appliesPreferredTrackTransform = true
    assetIG.requestedTimeToleranceBefore = CMTimeMakeWithSeconds(0.5, preferredTimescale: 1000000)
    assetIG.requestedTimeToleranceAfter = CMTimeMakeWithSeconds(0.5, preferredTimescale: 1000000)
    
    let roundedSeconds = round(seconds)
    let time = CMTimeMakeWithSeconds(Float64(roundedSeconds), preferredTimescale: 1)
    
    do {
      let cgImage = try await assetIG.copyCGImageAsync(at: time, actualTime: nil)
      
#if os(iOS)
      return (image: Image(uiImage: UIImage(cgImage: cgImage)),
              size: CGSize(width: cgImage.width, height: cgImage.height))
#elseif os(macOS)
      let platformImage = NSImage(cgImage: cgImage, size: NSSize(width: cgImage.width, height: cgImage.height))
      return (image: Image(nsImage: platformImage),
              size: CGSize(width: cgImage.width, height: cgImage.height))
#endif
      
    } catch {
      print(error.localizedDescription)
      return (image: nil, size: .zero)
    }
  }
}
