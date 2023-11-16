import SwiftUI

struct DefaultTextField: View {
  var label: String
  @Binding var text: String
  var placeholder: String
  var keyboardType: UIKeyboardType = .default
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(label)
        .font(.callout)
        .padding(.vertical, 4)
        .padding(.horizontal)
      TextField(placeholder, text: $text)
        .keyboardType(keyboardType)
        .autocapitalization(.none)
        .disableAutocorrection(true)
        .padding(.vertical, 8)
        .defaultStyle()
        .accessibilityLabel(label)
    }
  }
}
