import SwiftUI
import UIKit

protocol AppModuleFactoryProtocol {
    func createMainScreen(
        repository: AppRepositoryProtocol
    ) -> (viewController: UIViewController, navigation: MainScreenNavigationProtocol)
}

final class AppModuleFactory: AppModuleFactoryProtocol {
    private let dependencySolver: AppDependencyProtocol

    init(_ dependencySolver: AppDependencyProtocol) {
        self.dependencySolver = dependencySolver
    }

    func createMainScreen(
        repository: AppRepositoryProtocol
    ) -> (viewController: UIViewController, navigation: MainScreenNavigationProtocol) {
        let navigation = MainScreenNavigation()
        let viewModel = MainScreenViewModel(
            navigation: navigation,
            repository: repository,
            overlayManager: dependencySolver.makeOverlayManager()
        )
        let view = MainScreenView(viewModel: viewModel)

        return (UIHostingController(rootView: view), navigation)
    }
}
