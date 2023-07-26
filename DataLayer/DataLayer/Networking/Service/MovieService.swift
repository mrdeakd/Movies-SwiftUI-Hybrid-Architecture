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

    public init(requestManager: RequestManager) {
        self.requestManager = requestManager
    }

    public func getMostPopularMovies() async throws -> [Movie] {
        try await MostPopularMovieMapper.convert(
            moviesDTO: call(request: MostPopularMoviesRequest()),
            genresDTO: call(request: AllGenresRequest())
        )
    }
}
