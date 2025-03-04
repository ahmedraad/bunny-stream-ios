import SwiftUI

struct SnackbarView: View {
  let message: String
  let duration: TimeInterval = 3
  var dismissAction: () -> Void
  
  @State private var isVisible = true
  
  var body: some View {
    VStack {
      HStack {
        Text(message)
          .padding()
          .foregroundColor(Color.white)
        
        Spacer()
      }
      .frame(maxWidth: .infinity)
      .background(Color.black.opacity(0.7))
      .cornerRadius(8)
      .opacity(isVisible ? 1 : 0)
      .animation(.easeInOut, value: isVisible)
    }
    .padding()
    .task {
        try? await Task.sleep(nanoseconds: UInt64(duration * 1_000_000_000))
        isVisible = false
        dismissAction()
    }
  }
}
