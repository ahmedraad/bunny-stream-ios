import Foundation

enum VideoPlayerError: Error {
  case unauthorized
  case notFound
  case internalServerError
  case unknownError
  case audioError
}
