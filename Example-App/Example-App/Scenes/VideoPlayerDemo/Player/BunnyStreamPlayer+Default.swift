//
//  BunnyStreamPlayer+Default.swift
//  Example-App
//
//  Created by Egzon Arifi on 17/11/2023.
//

import SwiftUI
import BunnyStreamPlayer

extension BunnyStreamPlayer {
  static func make(dependenciesManager: DependenciesManager, videoId: String) -> BunnyStreamPlayer {
    let playerIcons = PlayerIcons(play: Image(systemName: "play.fill"))
    let accessKey = dependenciesManager.accessKey.isEmpty ? nil : dependenciesManager.accessKey
    
    return BunnyStreamPlayer(
      accessKey: accessKey,
      videoId: videoId,
      libraryId: dependenciesManager.libraryId,
      playerIcons: playerIcons
    )
  }
}
