public struct MovieDTO: Response {
    enum CodingKeys: String, CodingKey {
        case adult
        case id
        case title
        case genreIds = "genre_ids"
        case popularity
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case overview
    }

    public let adult: Bool
    public let id: Int
    public let title: String
    public let genreIds: [Int]
    public let popularity: Float
    public let posterPath: String
    public let backdropPath: String
    public let overview: String
}
