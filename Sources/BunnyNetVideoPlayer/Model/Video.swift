import Foundation

struct Video {
  var chaptersList: ValidatedChapterList?
  var moments: [Moment]
  
  init(chaptersList: ValidatedChapterList?, moments: [Moment]) {
    self.chaptersList = chaptersList
    self.moments = moments
  }
}
