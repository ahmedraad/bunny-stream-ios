import Foundation

struct Heatmap {
  let data: [Int: Int]
  let sortedKeys: [Int]
  let maxValue: CGFloat
  
  init(data: [Int: Int], for duration: Int) {
    self.data = Heatmap.prepareHeatmapData(for: duration, data: data)
    self.sortedKeys = data.keys.sorted()
    self.maxValue = CGFloat(self.data.values.max() ?? 1)
  }
}

private extension Heatmap {
  /// Prepares the heatmap data for visualization by filling missing seconds with a specified rest value.
  /// This function ensures that the heatmap has continuous data for the entire duration. If a specific second is missing from the input data, it will be filled with a "rest" value. This rest value is specified by a special key `-1` in the input data dictionary.
  /// - Parameters:
  ///   - duration: The total duration in seconds for which the heatmap data should be prepared.
  ///   - data: The original heatmap data. The keys represent seconds, and the values represent the data for that second. A special key of `-1` indicates the "rest" value.
  /// - Returns: A dictionary containing the prepared heatmap data, filling in missing seconds with the rest value.
  static func prepareHeatmapData(for duration: Int, data: [Int: Int]) -> [Int: Int] {
    var preparedData = data
    guard let restValue = data[-1] else { return data }
    
    preparedData.removeValue(forKey: -1)
    
    for second in 0..<duration where preparedData[second] == nil {
      preparedData[second] = restValue
    }
    
    return preparedData
  }
}

extension Heatmap {
  func callAsFunction(_ second: Int) -> Int? {
    data[second]
  }
}
