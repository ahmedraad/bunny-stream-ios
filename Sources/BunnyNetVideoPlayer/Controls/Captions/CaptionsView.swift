import SwiftUI

struct CaptionsView: View {
  var captions: String?
  var backgroundColor: Color
  var fontColor: Color
  var fontSize: CGFloat
  
  var body: some View {
    if let captions {
      Text(captions)
        .font(.system(size: fontSize))
        .foregroundColor(fontColor)
        .padding(8)
        .background(backgroundColor)
        .cornerRadius(10)
        .padding(8)
        .multilineTextAlignment(.center)
    }
  }
}
