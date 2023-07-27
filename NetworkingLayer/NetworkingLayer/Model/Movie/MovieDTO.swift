public struct MovieDTO: Response {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case popularity
        case overview
        case genreIds = "genre_ids"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }

    public let id: Int
    public let title: String
    public let popularity: Float
    public let overview: String
    public let genreIds: [Int]
    public let posterPath: String
    public let backdropPath: String
}
