//
//  BunnyNetVideoPlayer+Default.swift
//  Example-App
//
//  Created by Egzon Arifi on 17/11/2023.
//

import SwiftUI
import BunnyNetVideoPlayer

extension BunnyNetVideoPlayer {
  static func make(dependenciesManager: DependenciesManager, videoId: String) -> BunnyNetVideoPlayer {
    let playerIcons = PlayerIcons(play: Image(systemName: "play.fill"))
    
    return BunnyNetVideoPlayer(
      accessKey: dependenciesManager.accessKey,
      videoId: videoId,
      libraryId: dependenciesManager.libraryId,
      cdn: dependenciesManager.cdnHostname,
      playerIcons: playerIcons
    )
  }
}
