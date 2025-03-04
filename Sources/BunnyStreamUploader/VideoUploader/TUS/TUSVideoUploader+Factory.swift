import Foundation
import TUSKit

/// Factory methods for creating TUSVideoUploader instances.
public extension TUSVideoUploader {
  /// Creates a preconfigured instance of TUSVideoUploader for use with BunnyCDN.
  ///
  /// This factory method sets up a complete video uploader with:
  /// - A configured TUS client for BunnyCDN's upload endpoint
  /// - Background upload support
  /// - Automatic upload resumption
  /// - Progress tracking
  ///
  /// Example usage:
  /// ```swift
  /// let uploader = TUSVideoUploader.make(
  ///     accessKey: "your-bunny-cdn-key",
  ///     chunkSize: 1024 * 1024 // 1MB chunks
  /// )
  /// ```
  ///
  /// - Parameters:
  ///   - accessKey: Your BunnyCDN API access key for authentication.
  ///   - chunkSize: The size of upload chunks in bytes. Larger chunks may upload faster
  ///                but use more memory. Defaults to 500KB (500 * 1024 bytes).
  /// - Returns: A fully configured TUSVideoUploader instance ready for use.
  /// - Note: The uploader is automatically started after creation and will attempt to
  ///         resume any previously interrupted uploads.
  static func make(accessKey: String, chunkSize: Int = 500 * 1024) -> TUSVideoUploader {
    let tusClient = try! TUSClient(server: URL(string: "https://video.bunnycdn.com/tusupload")!,
                                   sessionIdentifier: "TUSBunny",
                                   sessionConfiguration: .background(withIdentifier: "com.bunny.tus"),
                                   storageDirectory: URL(string: "/tusupload")!,
                                   chunkSize: chunkSize)

    let uploadTracker = UploadTracker()
    let videoUploader = TUSVideoUploader(uploadTracker: uploadTracker,
                                         tusClient: tusClient,
                                         videoSigner: VideoSHA256Signer(),
                                         videoRequestHeaderBuilder: VideoRequestHeaderBuilder(),
                                         accessKey: accessKey)
    tusClient.delegate = videoUploader

    try? videoUploader.start()
    return videoUploader
  }
}
