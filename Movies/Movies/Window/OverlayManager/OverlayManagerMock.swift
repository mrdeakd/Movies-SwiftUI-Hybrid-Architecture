import Foundation

public class OverlayManagerMock: OverlayManagerProtocol {
    private let loadingHandler: LoadingHandler
    private let alertHandler: AlertHandler

    init(
        loadingHandler: LoadingHandler = LoadingHandler(),
        alertHandler: AlertHandler = AlertHandler()
    ) {
        self.loadingHandler = loadingHandler
        self.alertHandler = alertHandler
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
        do {
            let response = try await request()
            action(response)
        } catch {
            guard let onCatch = onCatch else { return }
            onCatch(error)
        }
    }
}
