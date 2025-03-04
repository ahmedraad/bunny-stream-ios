import Foundation

/// A manager class that handles the lifecycle of upload tasks.
///
/// `URLSessionTaskManager` provides centralized management of upload tasks, including:
/// - Task storage and retrieval
/// - Task state control (suspend, resume, cancel)
/// - Automatic task cleanup
///
/// The manager maintains a mapping between task identifiers and their corresponding
/// upload tasks, allowing for easy task lookup and control.
class URLSessionTaskManager {
  /// A dictionary mapping task identifiers to their upload tasks.
  private var uploadTasks: [UUID: UploadTaskProtocol] = [:]

  /// Adds a new upload task to the manager and starts it.
  ///
  /// This method stores the task in the manager and immediately starts
  /// the upload by calling `resume()`.
  ///
  /// - Parameters:
  ///   - uuid: The unique identifier for the task.
  ///   - task: The upload task to manage.
  func addTask(for uuid: UUID, task: UploadTaskProtocol) {
    uploadTasks[uuid] = task
    task.resume()
  }

  /// Removes a task from the manager.
  ///
  /// This method:
  /// 1. Cancels the task if it's still active
  /// 2. Removes it from the manager's storage
  ///
  /// - Parameter uuid: The unique identifier of the task to remove.
  func removeTask(for uuid: UUID) {
    cancelTask(for: uuid)
    uploadTasks.removeValue(forKey: uuid)
  }

  /// Temporarily suspends an upload task.
  ///
  /// The task can be resumed later using `resumeTask(for:)`.
  ///
  /// - Parameter uuid: The unique identifier of the task to suspend.
  func suspendTask(for uuid: UUID) {
    uploadTasks[uuid]?.suspend()
  }

  /// Resumes a previously suspended upload task.
  ///
  /// - Parameter uuid: The unique identifier of the task to resume.
  func resumeTask(for uuid: UUID) {
    uploadTasks[uuid]?.resume()
  }

  /// Cancels an upload task.
  ///
  /// This stops the task but doesn't remove it from the manager.
  /// To completely remove the task, use `removeTask(for:)`.
  ///
  /// - Parameter uuid: The unique identifier of the task to cancel.
  func cancelTask(for uuid: UUID) {
    uploadTasks[uuid]?.cancel()
  }
}

/// A protocol defining the basic operations available for upload tasks.
///
/// This protocol abstracts the essential control operations for upload tasks,
/// making it possible to manage different types of upload tasks uniformly.
/// It matches the interface provided by URLSessionUploadTask for these
/// core operations.
protocol UploadTaskProtocol {
  /// Starts or resumes the upload task.
  func resume()

  /// Temporarily suspends the upload task.
  func suspend()

  /// Permanently cancels the upload task.
  func cancel()
}

/// Conformance of URLSessionUploadTask to UploadTaskProtocol.
///
/// URLSessionUploadTask already provides the required methods,
/// so no additional implementation is needed.
extension URLSessionUploadTask: UploadTaskProtocol { }
