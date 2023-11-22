//
//  VideoUploaderView+Factory.swift
//  Example-App
//
//  Created by Egzon Arifi on 16/10/2023.
//

import Foundation

extension VideoUploaderView {
  static func makeTUSVideoUploaderView(_ dependenciesManager: DependenciesManager) -> VideoUploaderView {
    let bunnyNetService = BunnyNetService(bunnyStreamSDK: dependenciesManager.bunnyStreamSDK)
    let viewModel = VideoUploaderViewModel(bunnyNetService: bunnyNetService,
                                           videoUploader: dependenciesManager.tusVideoUploader)
    return VideoUploaderView(videoUploader: dependenciesManager.tusVideoUploader, viewModel: viewModel)
  }
  
  static func makeURLSessionVideoUploaderView(_ dependenciesManager: DependenciesManager) -> VideoUploaderView {
    let bunnyNetService = BunnyNetService(bunnyStreamSDK: dependenciesManager.bunnyStreamSDK)
    let viewModel = VideoUploaderViewModel(bunnyNetService: bunnyNetService,
                                           videoUploader: dependenciesManager.urlSessionVideoUploader)
    return VideoUploaderView(videoUploader: dependenciesManager.urlSessionVideoUploader, viewModel: viewModel)
  }
}
