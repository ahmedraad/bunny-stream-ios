//
//  BunnyNetVideoPlayer+Default.swift
//  Example-App
//
//  Created by Egzon Arifi on 17/11/2023.
//

import SwiftUI
import BunnyVideoPlayer

extension BunnyVideoPlayer {
  static func make(dependenciesManager: DependenciesManager, videoId: String) -> BunnyVideoPlayer {
    let playerIcons = PlayerIcons(play: Image(systemName: "play.fill"))
    
    return BunnyVideoPlayer(
      accessKey: dependenciesManager.accessKey,
      videoId: videoId,
      libraryId: dependenciesManager.libraryId,
      cdn: dependenciesManager.cdnHostname,
      playerIcons: playerIcons
    )
  }
}
