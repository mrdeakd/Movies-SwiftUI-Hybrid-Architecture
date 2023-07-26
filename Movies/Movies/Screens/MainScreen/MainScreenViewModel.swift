import Combine
import SwiftUI
import Utils

protocol MainScreenViewModelProtocol: ObservableObject {
    func startLoading()
}

final class MainScreenViewModel: MainScreenViewModelProtocol {
    private let navigation: MainScreenNavigationProtocol
    private let repository: AppRepositoryProtocol
    private let overlayManager: OverlayManagerProtocol

    init(
        navigation: MainScreenNavigationProtocol,
        repository: AppRepositoryProtocol,
        overlayManager: OverlayManagerProtocol
    ) {
        self.navigation = navigation
        self.repository = repository
        self.overlayManager = overlayManager
    }

    func startLoading() {
        Task {
            await overlayManager.asyncRequestWithLoading(request: await load()) { value in
                print(value)
            }
        }
    }

    func load() async -> String {
        try? await Task.sleep(seconds: 2)
        return "Loading"
    }
}
