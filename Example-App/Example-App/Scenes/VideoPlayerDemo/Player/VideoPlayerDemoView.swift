//
//  SwiftUIView.swift
//
//
//  Created by Egzon Arifi on 20/10/2023.
//

import SwiftUI
import BunnyNetVideoPlayer

struct VideoPlayerDemoView: View {
  var accessKey: String
  var cdn: String
  var libraryId: Int
  var videoInfo: VideoResponseInfo
  
  init(accessKey: String, cdn: String, libraryId: Int, videoInfo: VideoResponseInfo) {
    self.accessKey = accessKey
    self.cdn = cdn
    self.libraryId = libraryId
    self.videoInfo = videoInfo
  }
  
  var body: some View {
    GeometryReader { geometry in
      VStack {
        BunnyNetVideoPlayer(accessKey: accessKey,
                            videoId: videoInfo.id,
                            libraryId: libraryId,
                            cdn: cdn)
        .frame(width: geometry.size.width, height: geometry.size.width < geometry.size.height ? geometry.size.width * (9 / 16) : geometry.size.height)
        
        if geometry.size.width < geometry.size.height {
          videoInformationView()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        
        Spacer()
      }
    }
    .navigationBarTitle(Text("Video Player"), displayMode: .inline)
  }
}

extension VideoPlayerDemoView {
  func videoInformationView() -> some View {
    VStack(alignment: .leading, spacing: 16) {
      Text(videoInfo.title ?? "")
        .font(.headline)
        .padding(.bottom)
      
      HStack {
        Image(systemName: "stopwatch")
        Text(Double(videoInfo.length).toFormattedTime())
      }
      
      HStack {
        Image(systemName: "eye")
        Text("\(videoInfo.views) views")
      }
      
      HStack {
        Image(systemName: "server.rack")
        Text(videoInfo.formattedFileSize)
      }
    }
  }
}
