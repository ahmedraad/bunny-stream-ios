//
//  UploadRecordRow.swift
//  Example-App
//
//  Created by Egzon Arifi on 11/10/2023.
//

import SwiftUI
import BunnyNetVideoUploader

struct UploadRecordRow: View {
  let uploadStatus: UploadStatus
  let info: UploadVideoInfo
  let actions: VideoUploaderActions
  
  var body: some View {
    Group {
      switch uploadStatus {
      case .paused(let progress):
        ProgressRowView(info: info,
                        bytesUploaded: progress.bytesUploaded,
                        totalBytes: progress.totalBytes,
                        category: .paused,
                        actions: actions)
      case .uploading(let progress):
        ProgressRowView(info: info,
                        bytesUploaded: progress.bytesUploaded,
                        totalBytes: progress.totalBytes,
                        category: .uploading,
                        actions: actions)
      case .failed(let error):
        FailedRowView(info: info, error: error, actions: actions)
      case .uploaded(let url):
        UploadedRowView(info: info, url: url)
     default:
        EmptyView()
      }
    }
    .rowPadding()
  }
}

extension View {
  func rowPadding() -> some View {
    self
      .padding(.vertical, 10)
      .padding(.leading, 5)
      .padding(.trailing, 15)
  }
}
