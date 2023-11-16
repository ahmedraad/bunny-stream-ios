import Foundation
import SwiftUI

enum Fonts: String, CaseIterable {
  case arial
  case inter
  case lato
  case oswald
  case raleway
  case roboto
  case rubik
  case ubuntu
  case system
  
  func size(_ size: CGFloat) -> Font {
    switch self {
    case .system:
      return .system(size: size)
    default:
      return .custom(rawValue, size: size)
    }
  }
}
