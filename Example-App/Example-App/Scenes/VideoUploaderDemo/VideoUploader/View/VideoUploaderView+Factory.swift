//
//  VideoUploaderView+Factory.swift
//  Example-App
//
//  Created by Egzon Arifi on 16/10/2023.
//

import Foundation

extension VideoUploaderView {
  static func makeTUSVideoUploaderView(_ dependenciesManager: DependenciesManager) -> VideoUploaderView {
    let bunnyService = BunnyService(bunnyStreamAPI: dependenciesManager.bunnyStreamAPI)
    let viewModel = VideoUploaderViewModel(bunnyService: bunnyService,
                                           videoUploader: dependenciesManager.tusVideoUploader)
    return VideoUploaderView(videoUploader: dependenciesManager.tusVideoUploader, viewModel: viewModel)
  }
  
  static func makeURLSessionVideoUploaderView(_ dependenciesManager: DependenciesManager) -> VideoUploaderView {
    let bunnyService = BunnyService(bunnyStreamAPI: dependenciesManager.bunnyStreamAPI)
    let viewModel = VideoUploaderViewModel(bunnyService: bunnyService,
                                           videoUploader: dependenciesManager.urlSessionVideoUploader)
    return VideoUploaderView(videoUploader: dependenciesManager.urlSessionVideoUploader, viewModel: viewModel)
  }
}
