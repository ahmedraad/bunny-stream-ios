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
  @State private var player = MediaPlayer.make(videoId: "01d32d4a-46b4-4b6e-848f-9512c6d1d29e",
                                               libraryId: 160961,
                                               cdn: "vz-3230d8ac-c35.b-cdn.net")
  
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
