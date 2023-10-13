//
//  DestructiveButton.swift
//  Example-App
//
//  Created by Egzon Arifi on 11/10/2023.
//

import SwiftUI

struct DestructiveButton: View {
  let title: String?
  let onTap: () -> Void
  
  var body: some View {
    Button {
      onTap()
    } label: {
      if let title {
        Text(title)
      }
      UploadActionImage(icon: .trash)
    }
  }
}
