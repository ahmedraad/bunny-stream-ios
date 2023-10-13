//
//  StreamAPIDemoView.swift
//  Example-App
//
//  Created by Egzon Arifi on 06/10/2023.
//

import SwiftUI

struct StreamAPIDemoView: View {
  @ObservedObject private var viewModel: StreamAPIDemoViewModel
  @State private var libraryId: String = ""
  
  init(viewModel: StreamAPIDemoViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    VStack {
      Text("🐇").font(.largeTitle)
      Text("Get videos from Stream API")
      
      TextField("Library ID", text: $libraryId)
        .keyboardType(.numberPad)
        .padding()
        .defaultStyle()
      
      Button(action: {
        if let libraryId = Int64(libraryId) {
          Task {
            await viewModel.loadVideos(libraryId: libraryId)
          }
        } else {
          viewModel.description = "Library ID It should be an integer!"
        }
      }) {
        Text("Load Videos")
      }
      .padding()
      
      if let description = viewModel.description {
        Text("Response:\n\(description)")
      }
    }
    .padding()
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .contentShape(Rectangle())
    .onTapGesture { endEditing() }
  }
}
