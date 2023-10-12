import Foundation
import TUSKit

public extension TUSVideoUploader {
  static func make(accessKey: String) -> TUSVideoUploader {
    let tusClient = try! TUSClient(server: URL(string: "https://video.bunnycdn.com/tusupload")!,
                                   sessionIdentifier: "TUSBunny",
                                   sessionConfiguration: .background(withIdentifier: "com.bunny.tus"),
                                   storageDirectory: URL(string: "/tusupload")!)
    
    let uploadTracker = UploadTracker()
    let bunnyNetService = BunnyNetService(bunnyNetClient: .init(accessKey: accessKey))
    let videoUploader = TUSVideoUploader(uploadTracker: uploadTracker,
                                         tusClient: tusClient,
                                         bunnyNetService: bunnyNetService,
                                         videoSigner: .init(),
                                         videoRequestHeaderBuilder: .init(),
                                         accessKey: accessKey)
    tusClient.delegate = videoUploader
    
    try? videoUploader.start()
    return videoUploader
  }
}
