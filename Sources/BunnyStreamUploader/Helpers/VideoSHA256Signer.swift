import Foundation
import CommonCrypto

/// A helper structure that generates SHA-256 signatures for video upload authentication.
///
/// This signer creates cryptographic signatures by combining video metadata with an API key
/// and hashing the result using SHA-256. These signatures are used to authenticate
/// upload requests to the server.
struct VideoSHA256Signer {
  /// Generates a SHA-256 signature for a video upload request.
  ///
  /// The signature is created by concatenating the library ID, API key, expiration time,
  /// and video ID, then hashing the result using SHA-256.
  ///
  /// - Parameters:
  ///   - info: The `VideoInfo` containing metadata about the video to be uploaded.
  ///   - apiKey: The API key used for authentication.
  /// - Returns: A hexadecimal string representation of the SHA-256 hash.
  func sign(info: VideoInfo, apiKey: String) -> String {
    let payload = "\(info.libraryId)" + apiKey + info.expirationTimeString + info.videoId
    return sha256(payload)
  }
  
  /// Computes the SHA-256 hash of a string.
  ///
  /// This method converts the input string to UTF-8 data and computes its SHA-256 hash
  /// using the CommonCrypto framework.
  ///
  /// - Parameter data: The string to hash.
  /// - Returns: A hexadecimal string representation of the SHA-256 hash.
  private func sha256(_ data: String) -> String {
    let data = Data(data.utf8)
    var hash = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
    data.withUnsafeBytes {
      _ = CC_SHA256($0.baseAddress, CC_LONG(data.count), &hash)
    }
    return hash.map { String(format: "%02x", $0) }.joined()
  }
}
