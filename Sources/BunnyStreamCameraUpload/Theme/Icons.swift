import SwiftUI

struct Icons {
  var stream: Image
  var stopStream: Image
  var flipCamera: Image
  var close: Image
  var mic: Image
  var mutedMic: Image
  
  init(
    stream: Image = Image(systemName: "dot.radiowaves.left.and.right"),
    stopStream: Image = Image(systemName: "stop.fill"),
    flipCamera: Image = Image(systemName: "arrow.triangle.2.circlepath"),
    close: Image = Image(systemName: "xmark"),
    mic: Image = Image(systemName: "mic"),
    mutedMic: Image = Image(systemName: "mic.slash")
  ) {
    self.stream = stream
    self.stopStream = stopStream
    self.flipCamera = flipCamera
    self.close = close
    self.mic = mic
    self.mutedMic = mutedMic
  }
}
