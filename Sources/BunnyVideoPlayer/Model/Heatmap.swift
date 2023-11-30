import Foundation

struct Heatmap {
  let data: [Int: Int]
  let sortedKeys: [Int]
  let maxValue: CGFloat
  
  init(data: [Int: Int]) {
    self.data = data
    self.sortedKeys = data.keys.sorted {
      if $0 == -1 { return false }
      if $1 == -1 { return true }
      return $0 < $1
    }
    self.maxValue = CGFloat(self.data.values.max() ?? 1)
  }
}

extension Heatmap {
  func callAsFunction(_ second: Int) -> Int? {
    data[second]
  }
}
