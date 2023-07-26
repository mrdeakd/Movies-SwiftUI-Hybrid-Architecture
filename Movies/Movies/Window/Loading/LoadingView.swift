import SwiftUI
import UI

public struct LoadingView: View {
    enum Layout {
        static let opacity: CGFloat = 0.8
        static let indicatorSize: CGSize = .init(width: 76, height: 76)
        static let easeOutDuration: CGFloat = 0.3
    }

    @EnvironmentObject var loadingHandler: LoadingHandler

    public var body: some View {
        ZStack {
            if loadingHandler.isPresented {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.gray.opacity(Layout.opacity))
                    .transition(.opacity)
                    .edgesIgnoringSafeArea(.all)
                ActivityIndicator(animate: loadingHandler.isPresented)
                    .frame(width: Layout.indicatorSize.width, height: Layout.indicatorSize.height)
            }
        }
        .animation(.easeOut(duration: Layout.easeOutDuration), value: loadingHandler.isPresented)
    }
}
