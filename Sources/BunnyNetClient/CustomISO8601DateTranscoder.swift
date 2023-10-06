import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

public struct CustomISO8601DateTranscoder: DateTranscoder {
  private let formatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    formatter.timeZone = TimeZone(abbreviation: "UTC")
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
  }()
  
  public func encode(_ date: Date) throws -> String {
    return formatter.string(from: date)
  }
  
  public func decode(_ dateString: String) throws -> Date {
    guard let date = formatter.date(from: dateString) else {
      throw DecodingError.dataCorrupted(
        .init(
          codingPath: [],
          debugDescription: "Expected date string to be in the format: yyyy-MM-dd'T'HH:mm:ss.SSS"
        )
      )
    }
    return date
  }
}
