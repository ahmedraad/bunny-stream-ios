import SwiftUI

struct TopMenuView: View {
  @Environment(\.theme) var theme: Theme
  @ObservedObject var viewModel: BunnyLiveStreamViewModel
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 20)
        .fill(Color.black.opacity(0.4))
      
      VStack {
        LiveIndicatorView(isLiveStreaming: viewModel.isLiveStreaming)
          .frame(maxWidth: 100, maxHeight: 40)
        
        if viewModel.isLiveStreaming {
          Text("00:09")
            .font(.caption)
            .fontWeight(.bold)
            .foregroundColor(.white)
        }
      }
      
      if !viewModel.isLiveStreaming {
        HStack {
          Spacer()
          Button(action: {}, label: {
            theme.icons.close
              .resizable()
              .scaledToFill()
              .foregroundColor(.white)
          })
          .frame(width: 20, height: 20)
        }
        .padding()
      }
    }
  }
}
