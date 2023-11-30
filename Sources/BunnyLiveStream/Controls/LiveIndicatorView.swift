import SwiftUI

struct LiveIndicatorView: View {
  var streamState: StreamState
  
  var body: some View {
    Text(streamState.liveIndicatorTitle)
      .foregroundColor(streamState == .liveStreaming ? .white : .black)
      .fontWeight(.bold)
      .padding(.horizontal)
      .padding(.vertical, 4)
      .background {
        RoundedRectangle(cornerRadius: 10)
          .fill(streamState == .liveStreaming ? .red : .white)
      }
  }
}

private extension StreamState {
  var liveIndicatorTitle: String {
    switch self {
    case .liveStreaming:
      return Lingua.LiveStream.indicatorLive
    case .notStreaming, .preparing:
      return Lingua.LiveStream.indicatorOffline
    case .retrying:
      return Lingua.LiveStream.indicatorRetrying
    }
  }
}
