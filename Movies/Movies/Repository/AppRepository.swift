import Foundation

public protocol MoviesRepositoryProtocol {
    func getMostPopularMovies() async throws -> [Movie]
}

public final class AppRepository: MoviesRepositoryProtocol {}
