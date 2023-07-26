import Common
import SwiftUI

protocol MovieDetailsScreenViewModelProtocol: ObservableObject {
    var movie: Movie { get }

    func markMovie()
}

class MovieDetailsScreenViewModel: MovieDetailsScreenViewModelProtocol {
    private let navigation: MovieDetailsNavigation

    @Binding var movie: Movie

    init(
        navigation: MovieDetailsNavigation,
        movie: Binding<Movie>
    ) {
        self.navigation = navigation
        self._movie = movie
    }

    func markMovie() {
        movie.isMarked.toggle()
    }
}
