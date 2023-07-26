import Foundation

public final class LoadingHandler: ObservableObject {
    @Published public var isPresented = false

    public init() {}

    public func showLoading() {
        isPresented = true
    }

    public func hideLoading() {
        isPresented = false
    }
}
