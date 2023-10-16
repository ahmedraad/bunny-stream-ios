//
//  VideoUploaderTypesView.swift
//  Example-App
//
//  Created by Egzon Arifi on 11/10/2023.
//

import SwiftUI

struct VideoUploaderTypesView: View {
  @EnvironmentObject var dependenciesManager: DependenciesManager
  
  var body: some View {
    NavigationStack {
      List {
        NavigationLink("TUS Resumable Uploads") {
          let bunnyNetService = BunnyNetService(bunnyNetClient: dependenciesManager.bunnyNetClient)
          let viewModel = TUSVideoUploaderViewModel(bunnyNetService: bunnyNetService,
                                                    videoUploader: dependenciesManager.videoUploader)
          TUSVideoUploaderView(videoUploader: dependenciesManager.videoUploader, viewModel: viewModel)
        }
      }
    }
  }
}
