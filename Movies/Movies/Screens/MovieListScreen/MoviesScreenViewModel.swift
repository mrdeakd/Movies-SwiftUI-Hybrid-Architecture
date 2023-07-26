import Common
import Foundation

class MoviesScreenViewModel: ObservableObject, MoviesScreenViewModelProtocol {
    @Published var movies: [Movie] = []
}
