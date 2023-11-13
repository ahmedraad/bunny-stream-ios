//
//  SwiftUIView.swift
//
//
//  Created by Egzon Arifi on 20/10/2023.
//

import SwiftUI
import BunnyNetVideoPlayer

struct VideoPlayerDemoView: View {
  @EnvironmentObject var dependenciesManager: DependenciesManager
  
  var body: some View {
    // TODO: Integrate video player
    Text("Video Player")
      .navigationBarTitle(Text("Video Player"), displayMode: .inline)
  }
}
