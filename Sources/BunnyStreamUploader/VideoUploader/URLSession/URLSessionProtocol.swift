import Foundation

/// A protocol that abstracts URLSession's upload task creation capabilities.
///
/// This protocol defines a testable interface for creating upload tasks, making it
/// possible to mock URLSession in tests while maintaining type safety. It provides
/// methods that mirror URLSession's upload task creation methods but return the
/// more abstract `UploadTaskProtocol` type.
protocol URLSessionProtocol {
  /// Creates an upload task that uploads a file.
  ///
  /// - Parameters:
  ///   - request: The URLRequest that specifies the upload destination and parameters.
  ///   - url: The file URL of the data to upload.
  ///   - completionHandler: A closure that receives the server's response.
  /// - Returns: An upload task conforming to UploadTaskProtocol.
  func customUploadTask(with request: URLRequest, fromFile url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> UploadTaskProtocol

  /// Creates an upload task that uploads data objects.
  ///
  /// - Parameters:
  ///   - request: The URLRequest that specifies the upload destination and parameters.
  ///   - bodyData: The data to upload.
  ///   - completionHandler: A closure that receives the server's response.
  /// - Returns: An upload task conforming to UploadTaskProtocol.
  func customUploadTask(with request: URLRequest, from bodyData: Data, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> UploadTaskProtocol
}

/// Conformance of URLSession to URLSessionProtocol.
///
/// This extension adapts URLSession's native upload task methods to return
/// the more abstract `UploadTaskProtocol` type, allowing URLSession to be
/// used wherever a URLSessionProtocol is expected.
extension URLSession: URLSessionProtocol {
  /// Creates a file-based upload task that conforms to UploadTaskProtocol.
  ///
  /// This method wraps URLSession's native `uploadTask(with:fromFile:completionHandler:)`
  /// method to return an UploadTaskProtocol-conforming task.
  ///
  /// - Parameters:
  ///   - request: The URLRequest that specifies the upload destination and parameters.
  ///   - url: The file URL of the data to upload.
  ///   - completionHandler: A closure that receives the server's response.
  /// - Returns: The created upload task as an UploadTaskProtocol.
  func customUploadTask(with request: URLRequest, fromFile url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> UploadTaskProtocol {
    uploadTask(with: request, fromFile: url, completionHandler: completionHandler)
  }

  /// Creates a data-based upload task that conforms to UploadTaskProtocol.
  ///
  /// This method wraps URLSession's native `uploadTask(with:from:completionHandler:)`
  /// method to return an UploadTaskProtocol-conforming task.
  ///
  /// - Parameters:
  ///   - request: The URLRequest that specifies the upload destination and parameters.
  ///   - bodyData: The data to upload.
  ///   - completionHandler: A closure that receives the server's response.
  /// - Returns: The created upload task as an UploadTaskProtocol.
  func customUploadTask(with request: URLRequest, from bodyData: Data, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> UploadTaskProtocol {
    uploadTask(with: request, from: bodyData, completionHandler: completionHandler)
  }
}
