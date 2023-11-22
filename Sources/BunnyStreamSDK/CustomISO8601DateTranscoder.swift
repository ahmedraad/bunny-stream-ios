import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

public struct CustomISO8601DateTranscoder: DateTranscoder {
  private let formatters: [DateFormatter] = {
    let commonAttributes: (DateFormatter) -> Void = { formatter in
      formatter.timeZone = TimeZone(abbreviation: "UTC")
      formatter.locale = Locale(identifier: "en_US_POSIX")
    }
    
    let standardFormatter = DateFormatter()
    standardFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    commonAttributes(standardFormatter)
    
    let extendedFormatter = DateFormatter()
    extendedFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSS'Z'"
    commonAttributes(extendedFormatter)
    
    return [standardFormatter, extendedFormatter]
  }()
  
  public func encode(_ date: Date) throws -> String {
    formatters.first!.string(from: date)
  }
  
  public func decode(_ dateString: String) throws -> Date {
    for formatter in formatters {
      if let date = formatter.date(from: dateString) {
        return date
      }
    }
    
    throw DecodingError.dataCorrupted(
      .init(
        codingPath: [],
        debugDescription: "Expected date string to be in either of the formats: yyyy-MM-dd'T'HH:mm:ss.SSS or yyyy-MM-dd'T'HH:mm:ss.SSSSSSS'Z'"
      )
    )
  }
}
