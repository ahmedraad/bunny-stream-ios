//
//  DependenciesManager.swift
//  Example-App
//
//  Created by Egzon Arifi on 13/10/2023.
//

import Foundation
import SwiftUI
import BunnyNetVideoUploader
import BunnyNetClient

class DependenciesManager: ObservableObject {
  @AppStorage("accessKey") var storedAccessKey: String? {
    didSet { updateAccessKey() }
  }
  @Published var accessKey: String
  
  @AppStorage("cdnHostname") var cdnHostname: String = ""
  @AppStorage("libraryId") var libraryId: Int = .zero
  
  var tusVideoUploader: TUSVideoUploader
  var urlSessionVideoUploader: URLSessionVideoUploader
  var bunnyNetClient: BunnyNetClient
  
  init() {
    let initialKey: String = UserDefaults.standard.string(forKey: "accessKey") ?? ""
    self.accessKey = initialKey
    self.tusVideoUploader = TUSVideoUploader.make(accessKey: initialKey)
    self.urlSessionVideoUploader = URLSessionVideoUploader.make(accessKey: initialKey)
    self.bunnyNetClient = BunnyNetClient.make(accessKey: initialKey)
  }
  
  private func updateAccessKey() {
    self.accessKey = storedAccessKey ?? ""
    self.tusVideoUploader = TUSVideoUploader.make(accessKey: accessKey)
    self.urlSessionVideoUploader = URLSessionVideoUploader.make(accessKey: accessKey)
    self.bunnyNetClient = BunnyNetClient.make(accessKey: accessKey)
  }
}
