import SwiftUI

struct LiveIndicatorView: View {
  var isLiveStreaming: Bool
  
  var body: some View {
    Text(isLiveStreaming ? "LIVE" : "OFFLINE")
      .foregroundColor(isLiveStreaming ? .white : .black)
      .fontWeight(.bold)
      .padding(.horizontal)
      .padding(.vertical, 4)
      .background {
        RoundedRectangle(cornerRadius: 10)
          .fill(isLiveStreaming ? .red : .white)
      }
  }
}
