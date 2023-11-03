import SwiftUI

struct SeekBarView: View {
  @ObservedObject var viewModel: SeekBarViewModel
  @Binding var isDraggingOutside: Bool
  @State private var size: CGSize = .zero
  @State private var isDragging: Bool = false
  @State private var dragPosition: CGFloat = .zero
  @State private var activeLabelTextSize: CGSize = .zero
  
  enum UI {
    static let inactiveBarHeight: CGFloat = 3
    static let activeBarHeight: CGFloat = 8
    static let scrubberDiameter: CGFloat = 15
    static let activeScrubberDiameter: CGFloat = 26
    static let momentCircleDiameter: CGFloat = 10
    static let scrubberOffset: CGFloat = activeScrubberDiameter / 2
    static let seekBarFrameHeight: CGFloat = 40
    static let thumbnailSize: CGFloat = 100
  }
  
  var body: some View {
    GeometryReader { geometry in
      ZStack(alignment: .leading) {
        chapterMarksView()
        progressMarksView()
        momentsView()
        thumbnailPreviewView()
        activeLabelView()
        scrubberView()
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
      dragPosition = min(max(size.width * CGFloat(percentage), -UI.scrubberOffset), size.width)
    }
  }
}

// MARK: - Views
private extension SeekBarView {
  @ViewBuilder
  func thumbnailPreviewView() -> some View {
    if let thumbnail = viewModel.thumbnailImage, isDragging {
      ZStack {
        thumbnail
          .resizable()
          .scaledToFit()
          .cornerRadius(5.0)
        
        VStack {
          Spacer()
          Text(viewModel.thumbnailTime)
            .foregroundColor(.white)
            .font(.caption)
            .shadow(radius: 5)
            .padding(4)
        }
      }
      .frame(width: viewModel.thumbnailSize.width, height: viewModel.thumbnailSize.height)
      .shadow(radius: 5)
      .cornerRadius(5.0)
      .clipped()
      .offset(x: thumbnailOffsetX, y: viewModel.thumbnailYOffset)
    }
  }
  
  func scrubberView() -> some View {
    Circle()
      .foregroundColor(.blue)
      .frame(width: isDragging ? UI.activeScrubberDiameter : UI.scrubberDiameter,
             height: isDragging ? UI.activeScrubberDiameter : UI.scrubberDiameter)
      .offset(x: safeDragPosition - UI.scrubberOffset, y: .zero)
  }
  
  @ViewBuilder
  func chapterMarksView() -> some View {
    if let chapters = viewModel.video.chaptersList {
      HStack(spacing: 2) {
        ForEach(chapters, id: \.id) { chapter in
          let isActiveChapter = isDragging && chapter.contains(currentPosition)
          Rectangle()
            .fill(Color.white.opacity(0.7))
            .frame(width: chapterWidth(for: chapter), height: isActiveChapter ? UI.activeBarHeight : UI.inactiveBarHeight)
        }
      }
    }
  }
  
  @ViewBuilder
  func progressMarksView() -> some View {
    if let chapters = viewModel.video.chaptersList {
      HStack(spacing: 2) {
        ForEach(chapters, id: \.id) { chapter in
          let isActiveChapter = isDragging && chapter.contains(currentPosition)
          Rectangle()
            .fill(Color.blue)
            .frame(width: playedWidth(for: chapter), height: isActiveChapter ? UI.activeBarHeight : UI.inactiveBarHeight)
        }
      }
    }
  }

  func momentsView() -> some View {
    ZStack {
      ForEach(viewModel.video.moments, id: \.id) { moment in
        let xOffset = (CGFloat(moment.second) / CGFloat(viewModel.duration)) * adjustedWidth
        MomentView(diameter: UI.momentCircleDiameter)
          .offset(x: xOffset - UI.momentCircleDiameter / 2, y: .zero)
      }
    }
  }
  
  @ViewBuilder
  func activeLabelView() -> some View {
    if let label = activeLabel() {
      Text(label)
        .font(.system(size: 12))
        .foregroundColor(.white)
        .shadow(radius: 10)
        .padding(10)
        .background(
          GeometryReader { proxy in
            Color.clear.preference(key: ViewSizeKey.self, value: proxy.size)
          }
        )
        .onPreferenceChange(ViewSizeKey.self) { size in
          self.activeLabelTextSize = size
        }
        .offset(x: safeActiveLabelXOffset(), y: -UI.activeScrubberDiameter)
    }
  }
}

// MARK: - Private methods
private extension SeekBarView {
  var totalSpacing: CGFloat {
    guard let chapters = viewModel.video.chaptersList else { return .zero }
    return CGFloat(chapters.count - 1) * 2
  }
  
  var adjustedWidth: CGFloat {
    size.width - totalSpacing
  }
  
  func chapterWidth(for chapter: Chapter) -> CGFloat {
    let chapterWidthPercentage = chapter.widthPercentage(duration: viewModel.duration)
    return max(chapterWidthPercentage * adjustedWidth, .zero)
  }
  
  var currentPosition: CGFloat {
    (dragPosition / adjustedWidth) * CGFloat(viewModel.duration)
  }
  
  func playedDuration(in chapter: Chapter) -> CGFloat {
    var played: CGFloat = 0
    if currentPosition >= CGFloat(chapter.start) {
      played = min(currentPosition - CGFloat(chapter.start), CGFloat(chapter.end - chapter.start))
    }
    return played
  }
  
  func playedWidth(for chapter: Chapter) -> CGFloat {
    let playedChapterWidthPercentage = playedDuration(in: chapter) / CGFloat(chapter.end - chapter.start)
    return max(playedChapterWidthPercentage * chapterWidth(for: chapter), .zero)
  }
  
  func activeLabel() -> String? {
    if let moment = viewModel.video.moments.first(where: { isDragging && $0.contains(currentPosition) }) {
      return moment.label
    } else if let chapter = viewModel.video.chaptersList?.first(where: { isDragging && $0.contains(currentPosition) }),
              case .regular(let title) = chapter.type {
      return title
    }
    return nil
  }
  
  func updatePlayerPosition(for size: CGSize) {
    let duration = viewModel.duration
    guard duration != .zero else { return }
    let percentage = Double(dragPosition / adjustedWidth)
    let seekTimeSeconds = duration * percentage
    viewModel.elapsedTime = seekTimeSeconds
    viewModel.player.jump(to: seekTimeSeconds)
  }
  
  func updateSizeAndPosition(with newSize: CGSize) {
    size = newSize
    let duration = viewModel.duration
    guard duration != .zero else { return }
    let percentage = viewModel.elapsedTime / duration
    dragPosition = min(max(newSize.width * CGFloat(percentage), -UI.scrubberOffset), newSize.width)
  }
  
  var thumbnailOffsetX: CGFloat {
    let potentialOffset = dragPosition - viewModel.thumbnailSize.width / 2
    let offsetFromLeft = max(potentialOffset, .zero)
    let offsetFromRight = min(offsetFromLeft, size.width - viewModel.thumbnailSize.width)
    return offsetFromRight
  }
  
  func safeActiveLabelXOffset() -> CGFloat {
    let xOffset = dragPosition
    let potentialOffset = xOffset - activeLabelTextSize.width / 2
    let offsetFromLeft = max(potentialOffset, .zero)
    return min(offsetFromLeft, adjustedWidth - viewModel.thumbnailSize.width)
  }
  
  var safeDragPosition: CGFloat {
    let buffer: CGFloat = 6.0
    return min(max(dragPosition, UI.scrubberOffset - buffer), adjustedWidth + buffer)
  }
}
