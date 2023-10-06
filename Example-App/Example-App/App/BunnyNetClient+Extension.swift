//
//  BunnyNetClient+Extension.swift
//  Example-App
//
//  Created by Egzon Arifi on 06/10/2023.
//

import Foundation
import BunnyNetClient

extension BunnyNetClient {
  static func make(accessKey: String?) -> BunnyNetClient {
    BunnyNetClient(accessKey: accessKey ?? "")
  }
}
