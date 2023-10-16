import Foundation
import TUSKit

public extension TUSVideoUploader {
  /// Create an instance of TUSVideoUploader
  /// - Parameters:
  ///   - accessKey: Bunny net access key
  ///   - chunkSize: The amount of bytes the data to upload will be chunked by. Defaults to 512 kB.
  /// - Returns: TUSVideoUploader instance
  static func make(accessKey: String, chunkSize: Int = 500 * 1024) -> TUSVideoUploader {
    let tusClient = try! TUSClient(server: URL(string: "https://video.bunnycdn.com/tusupload")!,
                                   sessionIdentifier: "TUSBunny",
                                   sessionConfiguration: .background(withIdentifier: "com.bunny.tus"),
                                   storageDirectory: URL(string: "/tusupload")!,
                                   chunkSize: chunkSize)
    
    let uploadTracker = UploadTracker()
    let videoUploader = TUSVideoUploader(uploadTracker: uploadTracker,
                                         tusClient: tusClient,
                                         videoSigner: .init(),
                                         videoRequestHeaderBuilder: .init(),
                                         accessKey: accessKey)
    tusClient.delegate = videoUploader
    
    try? videoUploader.start()
    return videoUploader
  }
}
