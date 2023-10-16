//
//  ProgressRowView.swift
//  Example-App
//
//  Created by Egzon Arifi on 11/10/2023.
//

import SwiftUI
import BunnyNetVideoUploader

struct ProgressRowView: View {
  let info: UploadVideoInfo
  let bytesUploaded: Int
  let totalBytes: Int
  let category: UploadListCategory
  let pauseAction: ((UploadVideoInfo) -> Void)?
  let resumeAction: ((UploadVideoInfo) -> Void)?
  let deleteAction: ((UploadVideoInfo) -> Void)?
  
  var body: some View {
    VStack {
      HStack(spacing: 8) {
        UploadStatusIndicator(color: category.color)
        
        VStack(alignment: .leading) {
          HStack {
            Text(category.title)
              .foregroundColor(category.color)
              .font(.subheadline)
              .bold()
            
            Text("(\(bytesUploaded) / \(totalBytes)) bytes")
              .foregroundColor(category.color)
              .font(.caption2)
          }
          
          Text("Video - \(info.info.title)")
            .font(.caption)
          Text("Video ID - \(info.videoUUID)")
            .font(.caption)
        }
        
        Spacer()
        
        if category == .uploading {
          ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .scaleEffect(x: 0.8, y: 0.8)
        }
        
        ActionsView(showTitle: false)
      }
      
      ProgressView(value: Float(bytesUploaded), total: Float(totalBytes))
        .accentColor(category.color)
        .padding(.bottom, 2)
    }
  }
  
  
  @ViewBuilder
  private func ActionsView(showTitle: Bool) -> some View {
    if category == .uploading {
      uploadingActionsView(showTitle: showTitle)
    } else {
      pausedActionsView(showTitle: showTitle)
    }
  }
  
  @ViewBuilder
  private func pausedActionsView(showTitle: Bool) -> some View {
    Button {
      resumeAction?(info)
    } label: {
      if showTitle {
        Text("Resume")
      }
      UploadActionImage(icon: .resume)
    }
    
    DestructiveButton(title: showTitle ? "Remove" : nil) {
      deleteAction?(info)
    }
  }
  
  @ViewBuilder
  private func uploadingActionsView(showTitle: Bool) -> some View {
    Button {
      pauseAction?(info)
    } label: {
      if showTitle {
        Text("Pause")
      }
      UploadActionImage(icon: .pause)
    }
    
    DestructiveButton(title: showTitle ? "Remove" : nil) {
      deleteAction?(info)
    }
  }
}
