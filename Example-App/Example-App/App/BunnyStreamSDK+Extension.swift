//
//  BunnyStreamSDK+Extension.swift
//  Example-App
//
//  Created by Egzon Arifi on 06/10/2023.
//

import Foundation
import BunnyStreamSDK

extension BunnyStreamSDK {
  static func make(accessKey: String) -> BunnyStreamSDK {
    BunnyStreamSDK(accessKey: accessKey)
  }
}
