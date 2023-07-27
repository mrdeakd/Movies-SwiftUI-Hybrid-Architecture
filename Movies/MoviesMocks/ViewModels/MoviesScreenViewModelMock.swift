import Common
import Foundation
import SwiftUI

class MoviesScreenViewModelMock: MoviesScreenViewModelProtocol {
    var movies: [Movie] = Movie.movieListMock

    func fetchMovies() {
        print("fetchMovies")
    }

    func fetchMoviesPublisher() {
        print("fetchMoviesPublisher")
    }

    func navigateToMovieDetails(_ selectedMovie: Movie) {
        print("navigateToMovieDetails with \(selectedMovie)")
    }
}
