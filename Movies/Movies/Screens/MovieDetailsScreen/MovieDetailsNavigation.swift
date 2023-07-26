import Foundation

protocol MovieDetailsNavigationProtocol {
    var onFinish: ((Bool) -> Void)? { get set }
}

final class MovieDetailsNavigation: MovieDetailsNavigationProtocol {
    var onFinish: ((Bool) -> Void)?
}
