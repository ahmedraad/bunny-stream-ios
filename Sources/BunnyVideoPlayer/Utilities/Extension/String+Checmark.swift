import Foundation

extension String {
  func addCheckmark(_ condition: Bool) -> String {
    if condition {
      return self + " ✓"
    } else {
      return self
    }
  }
}
