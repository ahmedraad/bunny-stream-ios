import SwiftUI

struct SeekBarView: View {
  @ObservedObject var viewModel: SeekBarViewModel
  @Binding var isDraggingOutside: Bool
  @State private var size: CGSize = .zero
  @State private var isDragging: Bool = false
  @State private var dragPosition: CGFloat = .zero
  
  enum UI {
    static let inactiveBarHeight: CGFloat = 3
    static let activeBarHeight: CGFloat = 6
    static let circleDiameter: CGFloat = 15
    static let activeDiameter: CGFloat = 20
    static let circleOffset: CGFloat = activeDiameter / 2
    static let seekBarFrameHeight: CGFloat = 40
    static let thumbnailWidth: CGFloat = 100
    static let thumbnailHeight: CGFloat = 70
    static let thumbnailSize: CGFloat = 100
    static let thumbnailOffsetY: CGFloat = -80
  }
  
  var body: some View {
    GeometryReader { geometry in
      ZStack(alignment: .leading) {
        Rectangle()
          .foregroundColor(Color.gray.opacity(0.4))
          .frame(height: isDragging ? UI.activeBarHeight : UI.inactiveBarHeight)
        
        Rectangle()
          .foregroundColor(.blue)
          .frame(width: max(.zero, dragPosition),
                 height: isDragging ? UI.activeBarHeight : UI.inactiveBarHeight)
        
        thumbnailPreviewView()
        
        Circle()
          .foregroundColor(.blue)
          .frame(width: isDragging ? UI.activeDiameter : UI.circleDiameter,
                 height: isDragging ? UI.activeDiameter : UI.circleDiameter)
          .offset(x: safeDragPosition - UI.circleOffset, y: .zero)
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
    .gesture(DragGesture(minimumDistance: .zero).onChanged { value in
      isDragging = true
      isDraggingOutside = true
      dragPosition = min(max(value.location.x, .zero), size.width)
      
      Task {
        await viewModel.generateThumbnail(at: Double(dragPosition / size.width) * viewModel.duration)
      }
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
      let percentage = currentTime / duration
      dragPosition = min(max(size.width * CGFloat(percentage), -UI.circleOffset), size.width)
    }
  }
}

private extension SeekBarView {
  @ViewBuilder
  func thumbnailPreviewView() -> some View {
    if let thumbnail = viewModel.thumbnailImage, isDragging {
      VStack {
        ZStack {
          thumbnail
            .resizable()
            .aspectRatio(contentMode: .fill)
            .cornerRadius(5.0)
          VStack {
            Spacer()
            Text(viewModel.thumbnailTime)
              .foregroundColor(.white)
              .font(.caption)
              .shadow(radius: 5)
              .padding(.bottom, 2)
          }
        }
      }
      .frame(width: UI.thumbnailWidth, height: UI.thumbnailHeight)
      .shadow(radius: 5)
      .offset(x: thumbnailOffsetX, y: UI.thumbnailOffsetY)
    }
  }
  
  func updatePlayerPosition(for size: CGSize) {
    let duration = viewModel.duration
    guard duration != .zero else { return }
    let percentage = Double(dragPosition / size.width)
    let seekTimeSeconds = duration * percentage
    viewModel.elapsedTime = seekTimeSeconds
    viewModel.player.jump(to: seekTimeSeconds)
  }
  
  func updateSizeAndPosition(with newSize: CGSize) {
    size = newSize
    let duration = viewModel.duration
    guard duration != .zero else { return }
    let percentage = viewModel.elapsedTime / duration
    dragPosition = min(max(newSize.width * CGFloat(percentage), -UI.circleOffset), newSize.width)
  }
  
  var thumbnailOffsetX: CGFloat {
    let potentialOffset = dragPosition - UI.thumbnailWidth / 2
    let offset: CGFloat = 12
    let offsetFromLeft = max(potentialOffset, offset)
    let offsetFromRight = min(offsetFromLeft, size.width - UI.thumbnailWidth - offset)
    return offsetFromRight
  }
  
  var safeDragPosition: CGFloat {
    let buffer: CGFloat = 6.0
    return min(max(dragPosition, UI.circleOffset - buffer), size.width + buffer)
  }
}
