import SwiftUI
import UI

public struct AlertView: View {
    enum Layout {
        static let cornerRadius: CGFloat = .s12
    }

    @EnvironmentObject var handler: AlertHandler

    public var body: some View {
        VStack {
            if let alert = handler.nextAlert {
                InfoItemView(
                    title: alert.title,
                    message: alert.message,
                    cornerRadius: Layout.cornerRadius,
                    didFinish: alert.didFinish
                )
                .transition(.opacity)
            }
            Spacer()
        }
        .animation(.easeInOut, value: handler.nextAlert)
        .padding()
    }
}
