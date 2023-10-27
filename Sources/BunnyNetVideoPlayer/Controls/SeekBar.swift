import SwiftUI

struct SeekBar: View {
  @ObservedObject var viewModel: VideoPlayerViewModel
  @Binding var isDraggingOutside: Bool
  @State private var isDragging: Bool = false
  @State private var dragPosition: CGFloat = 0
  @State private var size: CGSize = .zero
  
  enum UI {
    static let inactiveBarHeight: CGFloat = 3
    static let activeBarHeight: CGFloat = 6
    static let circleDiameter: CGFloat = 15
    static let activeDiameter: CGFloat = 20
    static let circleOffset: CGFloat = circleDiameter / 2
    static let seekBarFrameHeight: CGFloat = 40
  }
  
  var body: some View {
    GeometryReader { geometry in
      ZStack(alignment: .leading) {
        Rectangle()
          .frame(height: isDragging ? UI.activeBarHeight : UI.inactiveBarHeight)
          .foregroundColor(Color.gray.opacity(0.4))
        
        Rectangle()
          .foregroundColor(.blue)
          .frame(width: dragPosition, height: isDragging ? UI.activeBarHeight : UI.inactiveBarHeight)
        
        Circle()
          .foregroundColor(.blue)
          .frame(width: isDragging ? UI.activeDiameter : UI.circleDiameter, height: isDragging ? UI.activeDiameter : UI.circleDiameter)
          .offset(x: dragPosition - UI.circleOffset, y: .zero)
      }
      .onAppear {
        updateSizeAndPosition(with: geometry.size)
      }
      .onChange(of: geometry.size) { newSize in
        updateSizeAndPosition(with: newSize)
      }
      .frame(height: UI.seekBarFrameHeight)
    }
    .frame(height: UI.seekBarFrameHeight)
    .background(.gray.opacity(0.001))
    .gesture(DragGesture().onChanged { value in
      isDragging = true
      isDraggingOutside = true
      dragPosition = min(max(value.location.x, -UI.circleOffset), size.width - UI.circleOffset)
    }
      .onEnded { _ in
        isDragging = false
        isDraggingOutside = false
        updatePlayerPosition(for: size)
      }
    )
    .onReceive(viewModel.$elapsedTime) { currentTime in
      guard !isDragging else { return }
      let duration = viewModel.duration
      guard duration != .zero else { return }
      let percentage = viewModel.elapsedTime / duration
      dragPosition = min(max(size.width * CGFloat(percentage), -UI.circleOffset), size.width - UI.circleOffset)
    }
  }
}

private extension SeekBar {
  func updatePlayerPosition(for size: CGSize) {
    let duration = viewModel.duration
    guard duration != .zero else { return }
    let percentage = Double(dragPosition / size.width)
    let seekTimeSeconds = duration * percentage
    viewModel.player.jump(to: seekTimeSeconds)
  }
  
  func updateSizeAndPosition(with newSize: CGSize) {
    size = newSize
    let duration = viewModel.duration
    guard duration != .zero else { return }
    let percentage = viewModel.elapsedTime / duration
    dragPosition = min(max(newSize.width * CGFloat(percentage), -UI.circleOffset), newSize.width - UI.circleOffset)
  }
}
