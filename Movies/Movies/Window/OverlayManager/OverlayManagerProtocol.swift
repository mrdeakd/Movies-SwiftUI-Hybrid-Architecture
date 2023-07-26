import Foundation

public protocol OverlayManagerProtocol {
    func asyncRequestWithLoading<T>(
        request: @autoclosure () async throws -> T,
        onLoaded action: @escaping (T) -> Void
    ) async
}
