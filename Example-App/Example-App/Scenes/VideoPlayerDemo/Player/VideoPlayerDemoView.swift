//
//  SwiftUIView.swift
//
//
//  Created by Egzon Arifi on 20/10/2023.
//

import SwiftUI
import BunnyStreamPlayer

struct VideoPlayerDemoView: View {
  var dependenciesManager: DependenciesManager
  var videoInfo: VideoResponseInfo
  
  init(dependenciesManager: DependenciesManager,
       videoInfo: VideoResponseInfo) {
    self.dependenciesManager = dependenciesManager
    self.videoInfo = videoInfo
  }
  
  var body: some View {
    GeometryReader { geometry in
      VStack {
        BunnyStreamPlayer.make(dependenciesManager: dependenciesManager, videoId: videoInfo.id)
          .frame(width: geometry.size.width,
                 height: geometry.size.width < geometry.size.height ? geometry.size.width * (9 / 16) : geometry.size.height)
        
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
