import Foundation

// sourcery: AutoMockable
protocol MovieDetailsNavigationProtocol {
    var onFinish: (() -> Void)? { get set }
}

final class MovieDetailsNavigation: MovieDetailsNavigationProtocol {
    var onFinish: (() -> Void)?
}
