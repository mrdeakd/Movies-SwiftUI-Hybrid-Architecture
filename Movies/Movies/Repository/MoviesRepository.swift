import Combine
import Common
import DataLayer
import Foundation
import Utils

// sourcery: AutoMockable
public protocol MoviesRepositoryProtocol {
    func getMostPopularMovies() async throws -> [Movie]

    func getMostPopularMoviesPublisher() -> AnyPublisher<[Movie], Error>
}

public final class MoviesRepository: MoviesRepositoryProtocol {
    public func getMostPopularMovies() async throws -> [Movie] {
        try? await Task.sleep(seconds: 1)
        return try await MovieService.defaultService.getMostPopularMovies()
    }
}

// MARK: Combine wrappers
public extension MoviesRepository {
    func getMostPopularMoviesPublisher() -> AnyPublisher<[Movie], Error> {
        Future { [weak self] in
            guard let response = try await self?.getMostPopularMovies() else {
                throw DataLayerError.missingData
            }
            return response
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
