//
//  SwiftUIView.swift
//
//
//  Created by Egzon Arifi on 20/10/2023.
//

import SwiftUI
import BunnyNetVideoPlayer
import AVKit

struct VideoPlayerDemoView: View {
  @State private var player = MediaPlayer(url: URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4")!)

  var body: some View {
    GeometryReader { geometryReader in
      VStack {
        BunnyNetVideoPlayer(player: player)
          .frame(height: geometryReader.size.height > geometryReader.size.width ? geometryReader.size.height * 0.309 : geometryReader.size.height)
          .onAppear {
            player.play()
          }
          .onDisappear {
            player.pause()
          }
        
        Spacer()
      }
    }
    .navigationBarTitle(Text("Video Player"), displayMode: .inline)
  }
}
