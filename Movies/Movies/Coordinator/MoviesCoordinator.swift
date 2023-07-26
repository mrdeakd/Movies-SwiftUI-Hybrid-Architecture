import Foundation
import UIKit

public final class MoviesCoordinator: Coordinator {
    public var navigationController: UINavigationController
    public var onFinished: (() -> Void)

    private let repository: MoviesRepositoryProtocol
    private let factory: MoviesModuleFactoryProtocol

    private let dependecySolver: MoviesDependencyProtocol

    public init(
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
        gotoMainScreen()
    }

    private func gotoMainScreen() {
        var module = factory.createMoviesScreen(repository: repository)

        module.navigation.onFinish = {
            print("Finished")
        }

        navigationController.pushViewController(
            module.viewController,
            animated: !navigationController.viewControllers.isEmpty
        )
    }
}
