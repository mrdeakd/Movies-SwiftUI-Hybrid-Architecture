import Foundation
import SwiftUI

public struct AsyncImageView: View {
    enum Layout {
        static let opacity: CGFloat = 0.5
    }

    let url: String

    public var body: some View {
        SwiftUI.AsyncImage(url: URL(string: url)) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            Color.gray.opacity(Layout.opacity)
        }
    }

    public init(url: String) {
        self.url = url
    }
}
