import Foundation

public struct Movie: Identifiable {
    public struct Image {
        public let small: String
        public let large: String

        public init(small: String, large: String) {
            self.small = small
            self.large = large
        }
    }

    public let id: String
    public let title: String
    public let genres: String
    public let overView: String
    public let image: Image
    public let popularity: Float
    public var isMarked: Bool

    public init(
        id: String,
        title: String,
        genres: String,
        overView: String,
        image: Image,
        popularity: Float,
        isMarked: Bool
    ) {
        self.id = id
        self.title = title
        self.genres = genres
        self.overView = overView
        self.image = image
        self.popularity = popularity
        self.isMarked = isMarked
    }
}
