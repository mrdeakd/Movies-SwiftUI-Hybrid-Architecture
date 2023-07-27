import Foundation

protocol MoviesDependencyProtocol: BaseDependency, WindowDependencyProtocol {
    func makeMoviesRepository() -> MoviesRepositoryProtocol
}

class MoviesDependency: MoviesDependencyProtocol {
    private let loadingHandler = LoadingHandler()
    private let alertHandler = AlertHandler()

    func makeMoviesRepository() -> MoviesRepositoryProtocol {
        MoviesRepository()
    }

    func makeOverlayManager() -> OverlayManagerProtocol {
        OverlayManager(appDependency: self)
    }

    func makeLoadingHandler() -> LoadingHandler {
        loadingHandler
    }

    func makeAlertHandler() -> AlertHandler {
        alertHandler
    }
}
