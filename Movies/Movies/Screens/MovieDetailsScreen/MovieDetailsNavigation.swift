import Common
import Foundation

// sourcery: AutoMockable
protocol MovieDetailsNavigationProtocol {
    var onFinish: (() -> Void)? { get set }
    var onChangeMarkMovie: ((Movie) -> Void)? { get set }
}

final class MovieDetailsNavigation: MovieDetailsNavigationProtocol {
    var onFinish: (() -> Void)?
    var onChangeMarkMovie: ((Movie) -> Void)?
}
