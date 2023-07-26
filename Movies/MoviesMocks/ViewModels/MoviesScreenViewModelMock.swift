import Common
import Foundation

class MoviesScreenViewModelMock: MoviesScreenViewModelProtocol {
    var movies: [Movie] = Movie.movieListMock

    func fetchMovies() {
        print("fetchMovies")
    }
}
