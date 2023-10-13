//
//  ExampleApp.swift
//  Example-App
//
//  Created by Egzon Arifi on 06/10/2023.
//

import SwiftUI

@main
struct ExampleApp: App {
  @StateObject var dependenciesManager = DependenciesManager()

  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(dependenciesManager)
    }
  }
}
