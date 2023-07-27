import Combine
import Common
import Foundation
import SwiftUI
import Utils

protocol MoviesScreenViewModelProtocol: ObservableObject {
    var movies: [Movie] { get set }

    func fetchMovies() async
    func fetchMoviesPublisher()

    func navigateToMovieDetails(_ selectedMovie: Binding<Movie>)
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
    func navigateToMovieDetails(_ selectedMovie: Binding<Movie>) {
        navigation.onNavigateToMovieDetails?(selectedMovie)
    }
}
