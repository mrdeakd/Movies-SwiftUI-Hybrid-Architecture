import SwiftUI
import UIKit

protocol MoviesModuleFactoryProtocol {
    func createMoviesScreen(
        repository: MoviesRepositoryProtocol
    ) -> (viewController: UIViewController, navigation: MoviesScreenNavigationProtocol)
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
}
