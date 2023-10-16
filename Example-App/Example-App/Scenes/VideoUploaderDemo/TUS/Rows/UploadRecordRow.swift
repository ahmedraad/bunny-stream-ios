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
  
  let pauseAction: ((UploadVideoInfo) -> Void)?
  let resumeAction: ((UploadVideoInfo) -> Void)?
  let deleteAction: ((UploadVideoInfo) -> Void)?
  
  var body: some View {
    Group {
      switch uploadStatus {
      case .paused(let progress):
        ProgressRowView(info: info,
                        bytesUploaded: progress.bytesUploaded,
                        totalBytes: progress.totalBytes,
                        category: .paused,
                        pauseAction: pauseAction,
                        resumeAction: resumeAction,
                        deleteAction: deleteAction)
      case .uploading(let progress):
        ProgressRowView(info: info,
                        bytesUploaded: progress.bytesUploaded,
                        totalBytes: progress.totalBytes,
                        category: .uploading,
                        pauseAction: pauseAction,
                        resumeAction: resumeAction,
                        deleteAction: deleteAction)
      case .failed(let error):
        FailedRowView(info: info, error: error, deleteAction: deleteAction)
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
