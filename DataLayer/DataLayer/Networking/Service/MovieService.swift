import Common
import NetworkingLayer

public protocol MovieServiceProtocol {
    func getMostPopularMovies() async throws -> [Movie]
}

public final class MovieService: ServiceProtocol, MovieServiceProtocol {
    public static let defaultService: MovieService = {
        MovieService(requestManager: RequestManager())
    }()

    var requestManager: RequestManager

    private init(requestManager: RequestManager) {
        self.requestManager = requestManager
    }

    public func getMostPopularMovies() async throws -> [Movie] {
        async let movies = call(request: MostPopularMoviesRequest())
        async let genres = call(request: AllGenresRequest())
        return try await MostPopularMovieMapper.convert(moviesDTO: movies, genresDTO: genres)
    }
}
