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
      VStack(spacing: 0) {
        BunnyStreamPlayer.make(dependenciesManager: dependenciesManager, videoId: videoInfo.id)
          .frame(width: geometry.size.width,
                 height: geometry.size.width < geometry.size.height ? geometry.size.width * (9 / 16) : geometry.size.height)
        
        if geometry.size.width < geometry.size.height {
          videoInformationView()
        }
      }
    }
  }
}

extension VideoPlayerDemoView {
  func videoInformationView() -> some View {
    List {
      Section {
        Text(videoInfo.title ?? "")
          .font(.headline)
        
        HStack(spacing: 12) {
          Image(systemName: "stopwatch.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
            .foregroundStyle(.gray)
          Text(Double(videoInfo.length).toFormattedTime())
        }
        
        HStack(spacing: 12) {
          Image(systemName: "eye.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
            .foregroundStyle(.gray)
          Text("\(videoInfo.views) views")
        }
        
        HStack(spacing: 12) {
          Image(systemName: "server.rack")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
            .foregroundStyle(.gray)
          Text(videoInfo.formattedFileSize)
        }
      }
    }
    .ignoresSafeArea()
  }
}
