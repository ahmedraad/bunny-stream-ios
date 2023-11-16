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
  @State private var cdnHostname: String = ""
  @State private var libraryId: String = ""
  
  var body: some View {
    NavigationStack {
      List {
        NavigationLink("Bunny Stream Videos Demo") {
          VideoListView(viewModel: .init(bunnyNetClient: dependenciesManager.bunnyNetClient))
            .environmentObject(dependenciesManager)
        }
        NavigationLink("Bunny Video Uploader Demo") {
          VideoUploaderTypesView()
            .environmentObject(dependenciesManager)
        }
      }
      .navigationTitle("Examples")
      
      accessKeyView()
    }
    .onAppear {
      tempAccessKey = dependenciesManager.accessKey
      cdnHostname = dependenciesManager.cdnHostname
      libraryId = String(dependenciesManager.libraryId)
    }
  }
}

private extension ContentView {
  @ViewBuilder
  func accessKeyView() -> some View {
    Button("BunnyNet Configuration") {
      isShowingSheet = true
    }
    .sheet(isPresented: $isShowingSheet) {
      Form {
        Section(header: Text("Enter BunnyNet config data").font(.subheadline)) {
          DefaultTextField(label: "Access Key", text: $tempAccessKey, placeholder: "Enter your access key")
          DefaultTextField(label: "CDN hostname", text: $cdnHostname, placeholder: "Enter CDN hostname")
          DefaultTextField(label: "Library ID", text: $libraryId, placeholder: "Enter Library ID", keyboardType: .numberPad)
        }
        
        Button("Save", action: saveConfig)
      }
      .formStyle(.grouped)
      .navigationTitle("Settings")
      .navigationBarItems(trailing: Button("Cancel") { isShowingSheet = false })
    }
  }

  private func saveConfig() {
    dependenciesManager.storedAccessKey = tempAccessKey
    dependenciesManager.cdnHostname = cdnHostname
    dependenciesManager.libraryId = Int(libraryId) ?? .zero
    isShowingSheet = false
  }
}
