import Foundation
import CommonCrypto

public struct VideoSHA256Signer {
  public func sign(info: VideoInfo, apiKey: String, videoId: String) -> String {
    let payload = "\(info.libraryId)" + apiKey + info.expirationTimeString + videoId
    return sha256(payload)
  }
  
  private func sha256(_ data: String) -> String {
    let data = Data(data.utf8)
    var hash = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
    data.withUnsafeBytes {
      _ = CC_SHA256($0.baseAddress, CC_LONG(data.count), &hash)
    }
    return hash.map { String(format: "%02x", $0) }.joined()
  }
}
