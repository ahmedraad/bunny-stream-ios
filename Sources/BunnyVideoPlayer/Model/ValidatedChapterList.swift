import Foundation

struct ValidatedChapterList {
  let chapters: [Chapter]
  
  init?(originalChapters: [Chapter], duration: Double) {
    guard !originalChapters.isEmpty else {
      chapters = [.init(start: .zero, end: duration)]
      return
    }
    
    let sortedChapters = originalChapters.sorted { $0.start < $1.start }
    if Self.hasOverlappingChapters(in: sortedChapters) { return nil }
    
    self.chapters = Self.withGapsAndRests(for: sortedChapters, duration: duration)
  }
}
 
private extension ValidatedChapterList {
  static func withGapsAndRests(for chapters: [Chapter], duration: Double) -> [Chapter] {
    var all: [Chapter] = []
    
    // Check if the first chapter starts after time 0 and insert a 'Gap' chapter if necessary
    if !chapters.isEmpty, let firstChapter = chapters.first, firstChapter.start > 0 {
      all.append(Chapter(start: 0, end: firstChapter.start, type: .gap))
    }
    
    for i in chapters.indices {
      let chapter = chapters[i]
      
      // If this isn't the first chapter and there's a gap from the last chapter, insert a 'Gap' chapter
      if let lastItem = all.last, chapter.start > round(lastItem.end) {
        all.append(Chapter(start: lastItem.end, end: chapter.start, type: .gap))
      }
      
      all.append(chapter)
    }
    
    // Add the 'Rest' chapter at the end if needed
    if let lastChapter = all.last, lastChapter.end < round(duration) {
      all.append(Chapter(start: lastChapter.end, end: round(duration), type: .rest))
    }
    
    return all
  }
  
  static func hasOverlappingChapters(in chapters: [Chapter]) -> Bool {
    for i in 0..<chapters.count - 1 {
      if chapters[i].end > chapters[i+1].start {
        return true
      }
    }
    
    return false
  }
}

extension ValidatedChapterList: RandomAccessCollection {
  typealias Index = Int
  typealias Element = Chapter
  
  var startIndex: Int {
    chapters.startIndex
  }
  
  var endIndex: Int {
    chapters.endIndex
  }
  
  subscript(position: Int) -> Chapter {
    chapters[position]
  }
  
  func index(before i: Int) -> Int {
    chapters.index(before: i)
  }
  
  func index(after i: Int) -> Int {
    chapters.index(after: i)
  }
}
