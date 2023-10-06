//
//  ContentView.swift
//  Example-App
//
//  Created by Egzon Arifi on 06/10/2023.
//

import SwiftUI

struct ContentView: View {
  @AppStorage("accessKey") var accessKey: String?
  @State private var isShowingSheet = false
  @State private var tempAccessKey: String = ""
  
  var body: some View {
    NavigationStack {
      List {
        NavigationLink("Bunny Stream API Demo") {
          StreamAPIDemoView(viewModel: .init(bunnyNetClient: .make(accessKey: accessKey)))
        }
      }
      .navigationTitle("Examples")
      
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
            accessKey = tempAccessKey
            isShowingSheet = false
          }
          .padding()
        }
        .padding()
      }
    }
    .onAppear {
      tempAccessKey = accessKey ?? ""
    }
  }
}
