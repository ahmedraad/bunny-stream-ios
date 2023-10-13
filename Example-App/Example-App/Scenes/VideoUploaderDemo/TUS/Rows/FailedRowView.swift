//
//  FailedRowView.swift
//  Example-App
//
//  Created by Egzon Arifi on 11/10/2023.
//

import SwiftUI
import BunnyNetVideoUploader

struct FailedRowView: View {
  let info: UploadVideoInfo
  let error: Error
  let actions: VideoUploaderActions
  
  var body: some View {
    HStack(spacing: 8) {
      UploadStatusIndicator(color: UploadListCategory.failed.color)
      
      VStack(alignment: .leading) {
        Text(UploadListCategory.failed.title)
          .foregroundColor(UploadListCategory.failed.color)
          .font(.subheadline)
          .bold()
        
        Text("Video - \(info.info.title)")
          .font(.caption)
        Text("Video ID - \(info.videoUUID)")
          .font(.caption)
        
        Text("Error - \(error.localizedDescription)")
          .font(.caption)
          .foregroundColor(.gray)
      }
      
      Spacer()
      
      ActionsView(withTitle: false)
    }
  }
  
  @ViewBuilder
  func ActionsView(withTitle: Bool) -> some View {
    DestructiveButton(title: withTitle ? "Remove" : nil) {
      try? actions.removeUpload(for: info)
    }
  }
}
