//
//  VideoUploaderView.swift
//  Example-App
//
//  Created by Egzon Arifi on 11/10/2023.
//

import SwiftUI
import BunnyNetVideoUploader

struct VideoUploaderView: View {
  @StateObject private var uploadTrackerObservable: UploadTrackerObservable
  @ObservedObject var viewModel: VideoUploaderViewModel
  @State private var libraryId: String = "160961"
  @State private var errorMessage: String? = nil
  @State private var showingVideoPicker = false
  @State private var selectedVideos: [VideoPicker.Video] = []
  
  init(videoUploader: VideoUploader,
       viewModel: VideoUploaderViewModel) {
    _uploadTrackerObservable = StateObject(wrappedValue: UploadTrackerObservable(tracker: videoUploader.uploadTracker))
    self.viewModel = viewModel
  }
  
  var body: some View {
    NavigationStack {
      VStack {
        if let errorMessage = errorMessage {
          Text(errorMessage)
            .padding()
        }
        
        uploadRecordsListView()
        
        Spacer()
        
        TextField("Library ID", text: $libraryId)
          .keyboardType(.numberPad)
          .padding()
          .defaultStyle()
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .contentShape(Rectangle())
      .onTapGesture { endEditing() }
    }
    .toolbar {
      Button("Pick Videos") {
        showingVideoPicker.toggle()
      }
      .disabled(Int(libraryId) == nil)
    }
    .sheet(isPresented: $showingVideoPicker) {
      VideoPicker(selectedVideos: $selectedVideos) { videos in
        guard let libraryId = Int(libraryId) else { return }
        self.viewModel.uploadVideos(videos, libraryId: libraryId)
      }
    }
  }
}

extension VideoUploaderView {
  @ViewBuilder
  private func uploadRecordsListView() -> some View {
    if uploadTrackerObservable.uploads.isEmpty {
      Text("No videos!")
    } else {
      ScrollView {
        VStack(spacing: 0) {
          Divider()
          ForEach(Array(uploadTrackerObservable.uploads), id: \.key) { uploadPair in
            UploadRecordRow(uploadStatus: uploadPair.value,
                            info: uploadPair.key,
                            pauseAction: viewModel.pauseAction,
                            resumeAction: viewModel.resumeAction,
                            deleteAction: viewModel.deleteAction)
          }
        }
      }
    }
  }
}
