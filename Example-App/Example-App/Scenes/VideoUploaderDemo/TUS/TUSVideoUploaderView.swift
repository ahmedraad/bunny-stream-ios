//
//  TUSVideoUploaderView.swift
//  Example-App
//
//  Created by Egzon Arifi on 11/10/2023.
//

import SwiftUI
import BunnyNetVideoUploader

struct TUSVideoUploaderView: View {
  let videoUploader: TUSVideoUploader
  @StateObject private var uploadTrackerObservable: UploadTrackerObservable
  
  @State private var libraryId: String = ""
  @State private var errorMessage: String? = nil
  @State private var showingVideoPicker = false
  @State private var selectedVideos: [VideoPicker.Video] = []
  
  init(videoUploader: TUSVideoUploader) {
    self.videoUploader = videoUploader
    _uploadTrackerObservable = StateObject(wrappedValue: UploadTrackerObservable(tracker: videoUploader.uploadTracker))
  }
  
  var body: some View {
    NavigationStack {
      VStack {
        TextField("Library ID", text: $libraryId)
          .keyboardType(.numberPad)
          .padding()
          .defaultStyle()
        
        if let errorMessage = errorMessage {
          Text(errorMessage)
            .padding()
        }
        
        uploadRecordsListView()
        
        Spacer()
      }
    }
    .toolbar {
      Button("Pick Videos") {
        showingVideoPicker.toggle()
      }
    }
    .sheet(isPresented: $showingVideoPicker) {
      VideoPicker(selectedVideos: $selectedVideos, onCompletion: uploadVideos)
    }
  }
}

extension TUSVideoUploaderView {
  @ViewBuilder
  private func uploadRecordsListView() -> some View {
    if uploadTrackerObservable.uploads.isEmpty {
      Text("No videos!")
    } else {
      ScrollView {
        VStack(spacing: 0) {
          Divider()
          ForEach(Array(uploadTrackerObservable.uploads), id: \.key) { uploadPair in
            UploadRecordRow(uploadStatus: uploadPair.value, info: uploadPair.key, actions: videoUploader)
          }
        }
      }
    }
  }
  
  func uploadVideos(_ videos: [VideoPicker.Video]) {
    guard let libraryId = Int(libraryId) else { return }
    Task {
      do {
        let infos = videos.map {
          VideoInfo(content: .data($0.data),
                    title: $0.name,
                    fileType: $0.type,
                    libraryId: libraryId)
        }
        try await videoUploader.uploadVideos(with: infos)
        errorMessage = nil
      } catch {
        errorMessage = error.localizedDescription
      }
    }
  }
}
