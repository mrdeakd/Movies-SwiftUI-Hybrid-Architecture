import UIKit

public class OverlayManager: OverlayManagerProtocol {
    typealias Str = Rsc.Error

    enum Constant {
        static let delay: Int = 5
    }

    private let loadingHandler: LoadingHandler
    private let alertHandler: AlertHandler

    public init(appDependency: WindowDependencyProtocol) {
        self.loadingHandler = appDependency.makeLoadingHandler()
        self.alertHandler = appDependency.makeAlertHandler()
    }

    public func asyncRequestWithLoading<T>(
        request: () async throws -> T,
        onLoaded action: @escaping (T) -> Void
    ) async {
        await executeLoading(request: request, onLoaded: action)
    }

    func executeLoading<T>(
        request: () async throws -> T,
        onLoaded action: @escaping (T) -> Void,
        onCatch: ((Error) -> Void)? = nil
    ) async {
        DispatchQueue.main.async { [weak self] in
            self?.loadingHandler.showLoading()
        }
        do {
            let response = try await request()
            DispatchQueue.main.async { [weak self] in
                self?.loadingHandler.hideLoading()
                action(response)
            }
        } catch {
            DispatchQueue.main.async { [weak self] in
                self?.loadingHandler.hideLoading()
                guard let onCatch = onCatch else {
                    self?.alertHandler.addItemToAlertQueue(
                        item: AlertHandler.Item(
                            title: Str.Default.title,
                            message: error.localizedDescription,
                            delay: Constant.delay,
                            didFinish: {
                                self?.alertHandler.hideAfter()
                            }
                        )
                    )
                    return
                }
                onCatch(error)
            }
        }
    }
}
