public protocol WindowDependencyProtocol {
    func makeOverlayManager() -> OverlayManagerProtocol
    func makeLoadingHandler() -> LoadingHandler
    func makeAlertHandler() -> AlertHandler
}
