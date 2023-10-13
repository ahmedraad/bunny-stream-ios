//
//  UploadListCategory.swift
//  Example-App
//
//  Created by Egzon Arifi on 11/10/2023.
//

import SwiftUI
import BunnyNetVideoUploader

enum UploadListCategory: CaseIterable {
  case all
  case uploaded
  case failed
  case uploading
  case paused
  
  var title: String {
    switch self {
    case .all:          return "All"
    case .uploaded:     return "Uploaded"
    case .failed:       return "Failed"
    case .uploading:    return "Uploading"
    case .paused:       return "Paused"
    }
  }
  
  var color: Color {
    switch self {
    case .all:          return .clear
    case .uploaded:     return .green
    case .failed:       return .red
    case .uploading:    return .purple
    case .paused:       return .gray
    }
  }
  
  var noRecoredMessage: String {
    switch self {
    case .all:          return "No upload items"
    case .uploaded:     return "No uploaded items"
    case .failed:       return "No failed items"
    case .uploading:    return "No uploading items"
    case .paused:       return "No paused items"
    }
  }
  
  func isSameKind(status: UploadStatus) -> Bool {
    switch self {
    case .all:          return true
    case .uploaded:     if case .uploaded(_) = status { return true }
    case .failed:       if case .failed(_) = status { return true }
    case .uploading:    if case .uploading(_) = status { return true }
    case .paused:       if case .paused(_) = status { return true }
    }
    return false
  }
}
