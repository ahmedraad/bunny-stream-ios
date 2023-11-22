import Foundation

struct Chapter: Identifiable, Equatable {
  var id: UUID = UUID()
  var start: Double
  var end: Double
  var type: ChapterType = .rest
  
  static func == (lhs: Chapter, rhs: Chapter) -> Bool {
    lhs.id == rhs.id &&
    lhs.start == rhs.start &&
    lhs.end == rhs.end &&
    lhs.type == rhs.type
  }
  
  enum ChapterType: Equatable {
    case regular(title: String)
    case gap
    case rest
  }
}

extension Chapter {
  func contains(_ position: CGFloat) -> Bool {
    CGFloat(start) <= position && position <= CGFloat(end)
  }
  
  func widthPercentage(duration: Double) -> CGFloat {
    CGFloat(end - start) / CGFloat(ceil(duration))
  }
}
