//
//  UploadedRowView.swift
//  Example-App
//
//  Created by Egzon Arifi on 11/10/2023.
//

import SwiftUI
import BunnyNetVideoUploader

struct UploadedRowView: View {
  let info: UploadVideoInfo
  
  var body: some View {
    HStack(spacing: 8) {
      UploadStatusIndicator(color: UploadListCategory.uploaded.color)
      
      VStack(alignment: .leading) {
        Text(UploadListCategory.uploaded.title)
          .foregroundColor(UploadListCategory.uploaded.color)
          .font(.subheadline)
          .bold()
        
        Text("Video: \(info.info.title)")
          .font(.caption)
        
        if let videoURL = URL.makeVideoURL(libraryId: info.info.libraryId, videoId: info.videoUUID.uuidString) {
          Link("Uploaded link", destination: videoURL)
            .font(.caption2)
        }
        
        Spacer()
      }
      
      Spacer()
    }
  }
}

extension URL {
  static func makeVideoURL(libraryId: Int, videoId: String) -> URL? {
    URL(string: "https://video.bunnycdn.com/play/\(libraryId)/\(videoId.lowercased())")
  }
}
