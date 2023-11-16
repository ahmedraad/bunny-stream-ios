//
//  StreamAPIDemoVideoRow.swift
//  Example-App
//
//  Created by Egzon Arifi on 17/10/2023.
//
//

import SwiftUI

struct VideoListRow: View {
  var video: VideoResponseInfo
  var cdn: String
  
  var body: some View {
    ZStack {
      imageView()
      
      VStack {
        topView()
        
        Spacer()
        
        videoInfoView()
      }
      .background(
        LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.7)]),
                       startPoint: .center, endPoint: .bottom)
      )
    }
    .frame(height: 230)
    .cornerRadius(10)
    .shadow(radius: 5)
    .padding(.all, 8)
  }
}

extension VideoListRow {
  func imageView() -> some View {
    GeometryReader { geometry in
      VStack {
        AsyncImage(url: video.thumbnailFileURL(cdn: cdn)) { phase in
          switch phase {
          case .empty:
            ProgressView()
              .frame(width: geometry.size.width, height: geometry.size.height)
              .background(Color(.systemBackground))
          case .success(let image):
            image.resizable()
              .aspectRatio(contentMode: .fill)
          case .failure:
            Image(systemName: "photo")
              .foregroundColor(.gray)
              .scaledToFit()
              .frame(width: geometry.size.width, height: geometry.size.height)
          @unknown default:
            EmptyView()
          }
        }
        .clipped()
      }
      .frame(width: geometry.size.width, height: 230)
    }
  }
  
  func topView() -> some View {
    HStack {
      Spacer()
      if video.encodeProgress != 100 {
        capsuleText(string: "Uploading", foregroundColor: .purple)
      } else {
        capsuleText(string: "\(video.views) views")
      }
    }
    .padding()
  }
  
  func capsuleText(string: String, foregroundColor: Color = .gray) -> some View {
    Text(string)
      .foregroundColor(foregroundColor)
      .font(.caption)
      .padding()
      .frame(height: 25)
      .background(Capsule().fill(Color.white))
      .overlay(
        Capsule().stroke(Color.gray.opacity(0.4), lineWidth: 0.3)
      )
  }
  
  func videoInfoView() -> some View {
    VStack {
      VStack(alignment: .leading) {
        Text(video.title ?? "")
          .font(.headline)
          .foregroundColor(.white)
          .padding(.horizontal)
        HStack {
          Image(systemName: "stopwatch")
            .foregroundColor(.white)
          Text(Double(video.length).toFormattedTime())
            .foregroundColor(.white)
          Spacer()
          Text(video.formattedFileSize)
            .foregroundColor(.white)
        }
        .padding([.horizontal, .bottom])
      }
    }
  }
}
