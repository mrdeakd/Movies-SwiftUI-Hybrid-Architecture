import SwiftUI
import UI

public struct InfoItemView: View {
    typealias Str = Rsc.InfoItemView

    enum Layout {
        static let imageSize: CGSize = .init(width: .su16, height: .su16)
    }

    var title: String
    var message: String?
    var cornerRadius: CGFloat
    var renderMode: Image.TemplateRenderingMode
    var didFinish: (() -> Void)?

    public var body: some View {
        HStack(alignment: .top, spacing: .su20) {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: .su16, weight: .bold, design: .serif))
                    .foregroundColor(.white)
                if let message = message {
                    Text(message)
                        .font(.system(size: .su14, weight: .bold, design: .serif))
                        .foregroundColor(.white)
                }
            }
            .padding(.top, .su4)
            Spacer()
            if let didFinish = didFinish {
                Button(action: didFinish, label: {
                    Image(systemName: Str.xmark)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .frame(maxWidth: Layout.imageSize.width, maxHeight: Layout.imageSize.height)
                })
            }
        }
        .padding(.su24)
        .frame(maxWidth: .infinity)
        .background(UI.Asset.mediumGreen.swiftUIColor)
        .cornerRadius(cornerRadius)
    }

    public init(
        title: String,
        message: String? = nil,
        cornerRadius: CGFloat,
        renderMode: Image.TemplateRenderingMode = .template,
        didFinish: (() -> Void)? = nil
    ) {
        self.title = title
        self.message = message
        self.cornerRadius = cornerRadius
        self.renderMode = renderMode
        self.didFinish = didFinish
    }
}
