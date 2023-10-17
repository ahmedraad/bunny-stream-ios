//
//  StreamAPIDemoVideoRow.swift
//  Example-App
//
//  Created by Egzon Arifi on 17/10/2023.
//

import Foundation
import SwiftUI

struct StreamAPIDemoVideoRow: View {
  var video: (title: String?, url: URL?)
  
  var body: some View {
    VStack(alignment: .leading) {
      if let title = video.title {
        Text(title)
          .font(.headline)
      }
      
      if let url = video.url {
        Text("Video URL")
          .font(.subheadline)
          .foregroundColor(.blue)
          .onTapGesture {
            if UIApplication.shared.canOpenURL(url) {
              UIApplication.shared.open(url)
            }
          }
      }
    }
  }
}
