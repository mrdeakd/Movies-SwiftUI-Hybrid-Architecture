import Common
import Foundation
import SwiftUI

public final class MoviesCoordinator: Coordinator {
    public var navigationController: UINavigationController
    public var onFinished: (() -> Void)

    private let repository: MoviesRepositoryProtocol
    private let factory: MoviesModuleFactoryProtocol

    private let dependecySolver: MoviesDependencyProtocol

    init(
        dependencySolver: MoviesDependencyProtocol,
        navigationController: UINavigationController,
        onFinished: @escaping (() -> Void)
    ) {
        self.dependecySolver = dependencySolver
        self.factory = MoviesModuleFactory(dependencySolver)
        self.navigationController = navigationController
        self.onFinished = onFinished
        self.repository = dependencySolver.makeMoviesRepository()
    }

    public func start() {
        goToMoviesScreen()
    }

    private func goToMoviesScreen() {
        var module = factory.createMoviesScreen(repository: repository)

        module.navigation.onFinish = {
            print("Finished")
        }

        module.navigation.onNavigateToMovieDetails = { [weak self] movie in
            self?.goToMovieDetailsScreen(movie: movie)
        }

        navigationController.pushViewController(
            module.viewController,
            animated: !navigationController.viewControllers.isEmpty
        )
    }

    private func goToMovieDetailsScreen(movie: Binding<Movie>) {
        var module = factory.createMovieDetailsScreen(movie: movie)

        module.navigation.onFinish = {
            print("Finished")
        }

        navigationController.pushViewController(
            module.viewController,
            animated: !navigationController.viewControllers.isEmpty
        )
    }
}
