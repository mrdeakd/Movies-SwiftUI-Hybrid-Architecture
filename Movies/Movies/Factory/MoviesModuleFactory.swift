import SwiftUI
import UIKit

protocol MoviesModuleFactoryProtocol {
    func createMoviesScreen(
        repository: MoviesRepositoryProtocol
    ) -> (viewController: UIViewController, navigation: MoviesScreenNavigationProtocol)

    func createMovieDetailsScreen(
    ) -> (viewController: UIViewController, navigation: MovieDetailsNavigationProtocol)
}

final class MoviesModuleFactory: MoviesModuleFactoryProtocol {
    private let dependencySolver: MoviesDependencyProtocol

    init(_ dependencySolver: MoviesDependencyProtocol) {
        self.dependencySolver = dependencySolver
    }

    func createMoviesScreen(
        repository: MoviesRepositoryProtocol
    ) -> (viewController: UIViewController, navigation: MoviesScreenNavigationProtocol) {
        let navigation = MoviesScreenNavigation()
        let viewModel = MoviesScreenViewModel(
            navigation: navigation,
            repository: repository,
            overlayManager: dependencySolver.makeOverlayManager()
        )
        let view = MoviesScreenView(viewModel: viewModel)

        return (UIHostingController(rootView: view), navigation)
    }

    func createMovieDetailsScreen() -> (viewController: UIViewController, navigation: MovieDetailsNavigationProtocol) {
        let navigation = MovieDetailsNavigation()
        let viewModel = MovieDetailsScreenViewModel(
            navigation: navigation,
            movie: .constant(.movieListMock[0])
        )
        let view = MovieDetailsScreenView(viewModel: viewModel)

        return (UIHostingController(rootView: view), navigation)
    }
}
