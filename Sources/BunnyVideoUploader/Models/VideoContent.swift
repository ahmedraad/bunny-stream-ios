import Foundation

public enum VideoContent: Hashable {
  case data(Data)
  case url(URL)
  
  var fileExtension: String? {
    switch self {
    case .data:
      return nil
    case .url(let url):
      return url.pathExtension
    }
  }
}
