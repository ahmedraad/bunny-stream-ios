import SwiftUI

struct CaptionsView: View {
  var captions: String?
  var backgroundColor: Color
  var fontColor: Color
  var font: Font
  
  var body: some View {
    if let captions {
      Text(captions)
        .font(font)
        .foregroundColor(fontColor)
        .padding(8)
        .background(backgroundColor)
        .cornerRadius(10)
        .padding(8)
        .multilineTextAlignment(.center)
    }
  }
}
