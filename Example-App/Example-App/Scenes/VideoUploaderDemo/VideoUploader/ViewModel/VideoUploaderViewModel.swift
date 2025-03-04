//
//  VideoUploaderViewModel.swift
//  Example-App
//
//  Created by Egzon Arifi on 16/10/2023.
//

import Foundation
import SwiftUI
import BunnyStreamUploader
import BunnyStreamSDK

class VideoUploaderViewModel: ObservableObject {
  private let bunnyNetService: BunnyNetService
  private let videoUploader: VideoUploader
  @Published var errorMessage: String?
  
  init(bunnyNetService: BunnyNetService, videoUploader: VideoUploader) {
    self.bunnyNetService = bunnyNetService
    self.videoUploader = videoUploader
  }
  
  func uploadVideos(_ videos: [VideoPicker.Video], libraryId: Int) {
    Task {
      do {
        var infos: [VideoInfo] = []
        
        for video in videos {
          if let videoId = try await bunnyNetService.createVideo(title: video.name, libraryId: libraryId) {
            let info = VideoInfo(content: .data(video.data),
                                 title: video.name,
                                 fileType: video.type,
                                 videoId: videoId,
                                 libraryId: libraryId)
            infos.append(info)
          }
        }
        
        try await videoUploader.uploadVideos(with: infos)
        await updateErrorMessage(nil)
      } catch {
        await updateErrorMessage(error.localizedDescription)
      }
    }
  }
  
  func pauseAction(_ info: UploadVideoInfo) {
    do {
      try videoUploader.pauseUpload(for: info)
    } catch {
      errorMessage = error.localizedDescription
    }
  }
  
  func resumeAction(_ info: UploadVideoInfo) {
    do {
      try videoUploader.resumeUpload(for: info)
    } catch {
      errorMessage = error.localizedDescription
    }
  }
  
  func deleteAction(_ info: UploadVideoInfo) {
    Task {
      do {
        try await bunnyNetService.deleteVideo(info.videoUUID.uuidString, libraryId: info.info.libraryId)
        try videoUploader.removeUpload(for: info)
      } catch {
        await updateErrorMessage(error.localizedDescription)
      }
    }
  }
  
  @MainActor
  func updateErrorMessage(_ error: String?) {
    errorMessage = error
  }
}
