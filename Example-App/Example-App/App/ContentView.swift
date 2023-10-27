//
//  ContentView.swift
//  Example-App
//
//  Created by Egzon Arifi on 06/10/2023.
//

import SwiftUI
import BunnyNetVideoUploader

struct ContentView: View {
  @EnvironmentObject var dependenciesManager: DependenciesManager
  @State private var isShowingSheet = false
  @State private var tempAccessKey: String = ""
  
  var body: some View {
    NavigationStack {
      List {
        NavigationLink("Bunny Stream API Demo") {
          StreamAPIDemoView(viewModel: .init(bunnyNetClient: dependenciesManager.bunnyNetClient))
        }
        NavigationLink("Bunny Video Uploader Demo") {
          VideoUploaderTypesView()
            .environmentObject(dependenciesManager)
        }
        NavigationLink("Bunny Video Player Demo") {
          VideoPlayerDemoView()
        }
      }
      .navigationTitle("Examples")
      
      accessKeyView()
    }
    .onAppear {
      tempAccessKey = dependenciesManager.accessKey
    }
  }
}

private extension ContentView {
  @ViewBuilder
  func accessKeyView() -> some View {
    Button("Enter BunnyNet Access Key") {
      isShowingSheet = true
    }
    .sheet(isPresented: $isShowingSheet) {
      VStack {
        Text("Enter BunnyNet Access Key")
          .font(.headline)
        TextField("Access Key", text: $tempAccessKey)
          .padding()
          .border(Color.gray)
        Button("Save") {
          dependenciesManager.storedAccessKey = tempAccessKey
          isShowingSheet = false
        }
        .padding()
      }
      .padding()
    }
  }
}
