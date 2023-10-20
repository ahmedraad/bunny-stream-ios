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
  @State private var player = AVPlayer(url: URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4")!)

  var body: some View {
    VideoPlayerView(player: player)
      .frame(height: 220)
      .onAppear {
        player.play()
      }
  }
}
