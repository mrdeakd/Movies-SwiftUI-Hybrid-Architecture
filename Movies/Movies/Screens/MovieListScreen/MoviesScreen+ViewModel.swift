import Common
import Foundation
import Utils

protocol MoviesScreenViewModelProtocol: ObservableObject {
    var movies: [Movie] { get }

    func onAppear()
}

final class MoviesScreenViewModel: MoviesScreenViewModelProtocol {
    @Published var movies: [Movie] = []

    private let navigation: MoviesScreenNavigationProtocol
    private let repository: MoviesRepositoryProtocol
    private let overlayManager: OverlayManagerProtocol

    init(
        navigation: MoviesScreenNavigationProtocol,
        repository: MoviesRepositoryProtocol,
        overlayManager: OverlayManagerProtocol
    ) {
        self.navigation = navigation
        self.repository = repository
        self.overlayManager = overlayManager
    }

    func onAppear() {
        Task { await fetchMovies() }
    }

    private func fetchMovies() async {
        await overlayManager.asyncRequestWithLoading(request: await load()) { value in
            print(value)
        }
    }

    func load() async -> String {
        try? await Task.sleep(seconds: 2)
        return "Loading"
    }
}
