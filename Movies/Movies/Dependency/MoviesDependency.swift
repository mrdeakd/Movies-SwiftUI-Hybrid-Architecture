import Foundation

public protocol MoviesDependencyProtocol: BaseDependency, WindowDependencyProtocol {
    func makeMoviesRepository() -> MoviesRepositoryProtocol
}

public class MoviesDependency: MoviesDependencyProtocol {
    private let loadingHandler = LoadingHandler()
    private let alertHandler = AlertHandler()

    public func makeMoviesRepository() -> MoviesRepositoryProtocol {
        AppRepository()
    }

    public func makeOverlayManager() -> OverlayManagerProtocol {
        OverlayManager(appDependency: self)
    }

    public func makeLoadingHandler() -> LoadingHandler {
        loadingHandler
    }

    public func makeAlertHandler() -> AlertHandler {
        alertHandler
    }
}
