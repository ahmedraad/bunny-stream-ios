//
//  VideoListView.swift
//  Example-App
//
//  Created by Egzon Arifi on 06/10/2023.
//

import SwiftUI

struct VideoListView: View {
  @EnvironmentObject var dependenciesManager: DependenciesManager
  @ObservedObject private var viewModel: VideoListViewModel
  @State private var selection: VideoResponseInfo? = nil

  init(viewModel: VideoListViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    NavigationStack {
      List(viewModel.videoInfos, id: \.self) { videoInfo in
        if videoInfo.encodeProgress == 100 {
          NavigationLink(destination: VideoPlayerDemoView(accessKey: dependenciesManager.accessKey,
                                                          cdn: dependenciesManager.cdnHostname,
                                                          libraryId: dependenciesManager.libraryId,
                                                          videoInfo: videoInfo)) {
            VideoListRow(video: videoInfo, cdn: dependenciesManager.cdnHostname)
          }
        } else {
          VideoListRow(video: videoInfo, cdn: dependenciesManager.cdnHostname)
        }
      }
      .navigationTitle("Video List")
      .listStyle(.plain)
    }
    .task {
      await viewModel.loadVideos(libraryId: Int64(dependenciesManager.libraryId))
    }
  }
}
