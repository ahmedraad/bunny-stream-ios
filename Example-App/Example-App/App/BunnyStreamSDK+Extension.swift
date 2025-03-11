//
//  BunnyStreamAPI+Extension.swift
//  Example-App
//
//  Created by Egzon Arifi on 06/10/2023.
//

import Foundation
import BunnyStreamAPI

extension BunnyStreamAPI {
  static func make(accessKey: String) -> BunnyStreamAPI {
    BunnyStreamAPI(accessKey: accessKey)
  }
}
