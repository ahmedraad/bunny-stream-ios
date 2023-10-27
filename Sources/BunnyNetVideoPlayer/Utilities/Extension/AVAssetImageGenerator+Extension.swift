import AVKit

extension AVAssetImageGenerator {
  func copyCGImageAsync(at requestedTime: CMTime, actualTime: UnsafeMutablePointer<CMTime>?) async throws -> CGImage {
    try await withCheckedThrowingContinuation { continuation in
      self.generateCGImagesAsynchronously(forTimes: [NSValue(time: requestedTime)]) { _, cgImage, _, _, error in
        if let cgImage = cgImage {
          continuation.resume(returning: cgImage)
        } else if let error = error {
          continuation.resume(throwing: error)
        } else {
          continuation.resume(throwing: NSError(domain: "AVAssetImageGeneratorError", code: 1, userInfo: nil))
        }
      }
    }
  }
}

