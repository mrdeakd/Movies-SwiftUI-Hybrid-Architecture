import Common
import Foundation
import Utils

protocol MoviesScreenViewModelProtocol: ObservableObject {
    var movies: [Movie] { get set }

    func fetchMovies() async
}

final class MoviesScreenViewModel: MoviesScreenViewModelProtocol {
    private let navigation: MoviesScreenNavigationProtocol
    private let repository: MoviesRepositoryProtocol
    private let overlayManager: OverlayManagerProtocol

    @Published var movies: [Movie] = []

    init(
        navigation: MoviesScreenNavigationProtocol,
        repository: MoviesRepositoryProtocol,
        overlayManager: OverlayManagerProtocol
    ) {
        self.navigation = navigation
        self.repository = repository
        self.overlayManager = overlayManager
    }

    func fetchMovies() async {
        await overlayManager.asyncRequestWithLoading(
            request: try await repository.getMostPopularMovies()
        ) { [weak self] movies in
            self?.movies = movies
        }
    }
}
