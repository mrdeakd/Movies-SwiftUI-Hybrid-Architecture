import Common
import Foundation

class MovieDetailsScreenViewModel: ObservableObject, MovieDetailsScreenViewModelProtocol {
    @Published var movie: Movie

    init(movie: Movie) {
        self.movie = movie
    }

    func markMovie() {}
}
