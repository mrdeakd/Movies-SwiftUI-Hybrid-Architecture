import Common
import DataLayer
import Foundation

// sourcery: AutoMockable
public protocol MoviesRepositoryProtocol {
    func getMostPopularMovies() async throws -> [Movie]
}

public final class MoviesRepository: MoviesRepositoryProtocol {
    public func getMostPopularMovies() async throws -> [Movie] {
        try? await Task.sleep(seconds: 1)
        return try await MovieService.defaultService.getMostPopularMovies()
    }
}
