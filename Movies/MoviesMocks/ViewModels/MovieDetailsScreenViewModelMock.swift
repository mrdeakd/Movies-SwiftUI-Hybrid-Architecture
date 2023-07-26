import Common
import Foundation

class MovieDetailsScreenViewModelMock: MovieDetailsScreenViewModelProtocol {
    let movie: Movie = .movieListMock[0]

    func markMovie() {}
}
