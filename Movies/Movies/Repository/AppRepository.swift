import Common
import Foundation

public protocol MoviesRepositoryProtocol {
    func getMostPopularMovies() async throws -> [Movie]
}

public final class MoviesRepository: MoviesRepositoryProtocol {
    public func getMostPopularMovies() async throws -> [Movie] {
        []
    }
}
