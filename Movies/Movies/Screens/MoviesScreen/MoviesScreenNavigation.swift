import Common
import Foundation
import SwiftUI

// sourcery: AutoMockable
protocol MoviesScreenNavigationProtocol {
    var onFinish: (() -> Void)? { get set }
    var onNavigateToMovieDetails: ((Movie, @escaping (Movie) -> Void) -> Void)? { get set }
}

final class MoviesScreenNavigation: MoviesScreenNavigationProtocol {
    var onFinish: (() -> Void)?
    var onNavigateToMovieDetails: ((Movie, @escaping (Movie) -> Void) -> Void)?
}
