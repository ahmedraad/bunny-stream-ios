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
  @State private var selectedVideoInfo: VideoResponseInfo? = nil
  
  init(viewModel: VideoListViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    NavigationStack {
      switch viewModel.loadingState {
      case .loading:
        ProgressView()
          .frame(maxWidth: .infinity)
      case .loaded:
        List(viewModel.videoInfos, id: \.self) { videoInfo in
          if videoInfo.encodeProgress == 100 {
            Button(action: {
              selectedVideoInfo = videoInfo
            }) {
              VideoListRow(video: videoInfo, cdn: dependenciesManager.cdnHostname)
            }
          } else {
            VideoListRow(video: videoInfo, cdn: dependenciesManager.cdnHostname)
          }
        }
      case .failed(let string):
        Text(string)
      }
    }
    .navigationTitle("Video List")
    .listStyle(.plain)
    .task {
      await viewModel.loadVideos(libraryId: Int64(dependenciesManager.libraryId))
    }
    .sheet(item: $selectedVideoInfo) { videoInfo in
      VideoPlayerDemoView(dependenciesManager: dependenciesManager, videoInfo: videoInfo)
    }
  }
}
