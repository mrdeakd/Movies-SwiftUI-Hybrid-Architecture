import SwiftUI

public struct ActivityIndicator: View {
    enum Layout {
        static let startCircleFrom: CGFloat = .zero
        static let startCircleTo: CGFloat = 0.2

        static let endCircleFrom: CGFloat = 0.5
        static let endCircleTo: CGFloat = 0.7

        static let animationAngle: CGFloat = 360

        static let animationDuration: CGFloat = 1
    }

    @State private var animate = false

    private let style = StrokeStyle(lineWidth: .s6, lineCap: .round)
    private let color = Asset.lightGreen.swiftUIColor

    public var body: some View {
        ZStack {
            Circle()
                .trim(from: Layout.startCircleFrom, to: Layout.startCircleTo)
                .stroke(
                    AngularGradient(gradient: .init(colors: [color]), center: .center), style: style
                )
                .rotationEffect(.degrees(animate ? Layout.animationAngle : .zero))
            Circle()
                .trim(from: Layout.endCircleFrom, to: Layout.endCircleTo)
                .stroke(
                    AngularGradient(gradient: .init(colors: [color]), center: .center), style: style
                )
                .rotationEffect(.degrees(animate ? Layout.animationAngle : .zero))
        }.onAppear {
            withAnimation(.linear(duration: Layout.animationDuration).repeatForever(autoreverses: false)) {
                self.animate = true
            }
        }
    }

    public init(animate: Bool = false) {
        self.animate = animate
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator()
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
