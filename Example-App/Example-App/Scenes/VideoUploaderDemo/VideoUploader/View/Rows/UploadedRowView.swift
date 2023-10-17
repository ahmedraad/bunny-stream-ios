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
  let url: URL
  
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
        
        Link("Uploaded link", destination: url)
          .font(.caption2)
        
        Spacer()
      }
      
      Spacer()
    }
  }
}
