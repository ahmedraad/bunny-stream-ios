//
//  UploadStatusIndicator.swift
//  Example-App
//
//  Created by Egzon Arifi on 11/10/2023.
//

import SwiftUI

struct UploadStatusIndicator: View {
  let color: Color
  let width: CGFloat = 5
  
  var body: some View {
    VStack {
      RoundedRectangle(cornerRadius: width/2, style: .continuous)
        .foregroundColor(color)
        .frame(width: width)
    }
  }
}
