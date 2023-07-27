import Common
import SwiftUI

protocol MovieDetailsScreenViewModelProtocol: ObservableObject {
    var movie: Movie { get }

    func markMovie()
}

class MovieDetailsScreenViewModel: MovieDetailsScreenViewModelProtocol {
    private let navigation: MovieDetailsNavigation

    @Published var movie: Movie

    init(
        navigation: MovieDetailsNavigation,
        movie: Movie
    ) {
        self.navigation = navigation
        self.movie = movie
    }

    func markMovie() {
        movie.isMarked.toggle()
        navigation.onChangeMarkMovie?(movie)
    }
}
