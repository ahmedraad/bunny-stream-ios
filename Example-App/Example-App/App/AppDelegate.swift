//
//  AppDelegate.swift
//  Example-App
//
//  Created by Egzon Arifi on 13/10/2023.
//

import UIKit
import BunnyNetVideoUploader

class AppDelegate: NSObject, UIApplicationDelegate {
  let dependenciesManager = DependenciesManager()
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    return true
  }
  
  func application(_ application: UIApplication,
                   handleEventsForBackgroundURLSession identifier: String,
                   completionHandler: @escaping () -> Void) {
    dependenciesManager.tusVideoUploader.registerBackgroundHandler(completionHandler, forSession: identifier)
  }
}
