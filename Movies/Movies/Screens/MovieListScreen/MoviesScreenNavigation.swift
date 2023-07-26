import Foundation

protocol MoviesScreenNavigationProtocol {
    var onFinish: (() -> Void)? { get set }
}

final class MoviesScreenNavigation: MoviesScreenNavigationProtocol {
    var onFinish: (() -> Void)?
}
