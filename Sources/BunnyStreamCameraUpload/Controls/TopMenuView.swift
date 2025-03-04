import SwiftUI

struct TopMenuView: View {
  @Environment(\.theme) var theme: Theme
  @Environment(\.presentationMode) var presentationMode
  @ObservedObject var viewModel: BunnyStreamCameraUploadViewModel
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 20)
        .fill(Color.black.opacity(0.4))
      
      VStack {
        LiveIndicatorView(streamState: viewModel.state)
          .frame(maxHeight: 30)
        
        if let elapsedTime = viewModel.elapsedTime {
          Text(elapsedTime)
            .font(.caption)
            .fontWeight(.bold)
            .foregroundColor(.white)
        }
      }
      
      if viewModel.state != .liveStreaming {
        HStack {
          Spacer()
          Button(action: {
            presentationMode.wrappedValue.dismiss()
          }, label: {
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
