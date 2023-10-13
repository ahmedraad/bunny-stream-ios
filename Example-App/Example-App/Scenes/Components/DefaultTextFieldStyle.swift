//
//  DefaultTextFieldStyle.swift
//  Example-App
//
//  Created by Egzon Arifi on 12/10/2023.
//

import SwiftUI

struct DefaultTextFieldStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding(2)
      .font(.system(size: 16))
      .overlay(
        RoundedRectangle(cornerRadius: 8)
          .stroke(Color.gray.opacity(0.4), lineWidth: 1)
      )
      .padding(.horizontal)
  }
}

extension View {
  func defaultStyle() -> some View {
    self.modifier(DefaultTextFieldStyle())
  }
}

extension View {
  func endEditing() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
