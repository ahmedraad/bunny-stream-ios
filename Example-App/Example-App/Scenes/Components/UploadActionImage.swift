//
//  UploadActionImage.swift
//  Example-App
//
//  Created by Egzon Arifi on 11/10/2023.
//

import SwiftUI

struct UploadActionImage: View {
  let icon: Icon
  
  var body: some View {
    Image(systemName: icon.rawValue)
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(width: 20, height: 20)
      .foregroundColor(icon.color)
  }
}

enum Icon: String {
  // Upload action button
  case resume = "play.circle"
  case pause  = "pause.circle"
  case trash  = "trash"
  case clear  = "xmark.circle"
  
  // Tab items
  case uploadFile = "square.and.arrow.up"
  case uploadFileFilled = "square.and.arrow.up.fill"
  case uploadList = "list.bullet"
  
  // Nav bar
  case options    = "ellipsis.circle"
  case checkmark  = "checkmark.circle"
  
  var color: Color {
    switch self {
    case .resume:
      return .blue
    case .pause, .clear:
      return .blue
    case .trash:
      return .red
    default:
      return .clear
    }
  }
}
