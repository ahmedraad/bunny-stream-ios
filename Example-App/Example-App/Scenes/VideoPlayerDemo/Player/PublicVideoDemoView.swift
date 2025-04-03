//
//  PublicVideoDemoView.swift
//  Example-App
//
//  Created by Dejan Skledar on 02/04/2025.
//

import SwiftUI
import BunnyStreamPlayer

struct PublicVideoDemoView: View {
  var dependenciesManager: DependenciesManager
  var videoId: String
  
  init(
    dependenciesManager: DependenciesManager,
    videoId: String
  ) {
    self.dependenciesManager = dependenciesManager
    self.videoId = videoId
  }
  
  var body: some View {
    GeometryReader { geometry in
      VStack(alignment: .leading) {
        BunnyStreamPlayer.make(dependenciesManager: dependenciesManager, videoId: videoId)
          .frame(
            width: geometry.size.width,
            height: geometry.size.width < geometry.size.height ? geometry.size.width * (9 / 16) : geometry.size.height
          )
        
        Text("Direct Video Play")
          .font(.headline)
          .padding()
        
        Spacer()
      }
    }
    .navigationBarTitle(Text("Public Video Player"), displayMode: .inline)
  }
}
