//
//  BunnyNetVideoPlayer+Default.swift
//  Example-App
//
//  Created by Egzon Arifi on 17/11/2023.
//

import SwiftUI
import BunnyStreamPlayer

extension BunnyStreamPlayer {
  static func make(dependenciesManager: DependenciesManager, videoId: String) -> BunnyStreamPlayer {
    let playerIcons = PlayerIcons(play: Image(systemName: "play.fill"))
    
    return BunnyStreamPlayer(
      accessKey: dependenciesManager.accessKey,
      videoId: videoId,
      libraryId: dependenciesManager.libraryId,
      cdn: dependenciesManager.cdnHostname,
      playerIcons: playerIcons
    )
  }
}
