import Combine
import Common
import Foundation
import SwiftUI
import Utils

protocol MoviesScreenViewModelProtocol: ObservableObject {
    var movies: [Movie] { get set }

    func fetchMovies() async
    func fetchMoviesPublisher()
    func navigateToMovieDetails(_ selectedMovie: Movie)
}

final class MoviesScreenViewModel: MoviesScreenViewModelProtocol {
    private let navigation: MoviesScreenNavigationProtocol
    private let repository: MoviesRepositoryProtocol
    private let overlayManager: OverlayManagerProtocol

    private var cancellables: Set<AnyCancellable> = []

    @Published var movies: [Movie] = []

    init(
        navigation: MoviesScreenNavigationProtocol,
        repository: MoviesRepositoryProtocol,
        overlayManager: OverlayManagerProtocol
    ) {
        self.navigation = navigation
        self.repository = repository
        self.overlayManager = overlayManager

        // viewModel.fetchMoviesPublisher()
        Task { await fetchMovies() }
    }

    /// Async await solution
    func fetchMovies() async {
        await overlayManager.asyncRequestWithLoading(
            request: try await repository.getMostPopularMovies()
        ) { [weak self] movies in
            self?.movies = movies
        }
    }

    /// Publisher wrapper solution
    func fetchMoviesPublisher() {
        overlayManager.showLoading()
        repository.getMostPopularMoviesPublisher()
            .sink(
                receiveCompletion: { [weak self] completion in
                    defer { self?.overlayManager.hideLoading() }
                    guard case .failure(let error) = completion else { return }
                    AppLogger.shared.error(error.localizedDescription, category: .network)
                },
                receiveValue: { [weak self] movies in
                    self?.movies = movies
                }
            )
            .store(in: &cancellables)
    }

    /// SwiftUI-UIKit Hibrid architecture solution in case we remove the SwiftUI navigation
    func navigateToMovieDetails(_ selectedMovie: Movie) {
        navigation.onNavigateToMovieDetails?(selectedMovie) { [weak self] movie in
            guard let indexOfMovie = self?.movies.firstIndex(where: { $0.id == movie.id })
            else { return }
            self?.movies.modifyElement(atIndex: indexOfMovie) { element in
                element.isMarked = movie.isMarked
            }
        }
    }
}
