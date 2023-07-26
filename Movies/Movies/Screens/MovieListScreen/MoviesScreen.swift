import Common
import SwiftUI

protocol MoviesScreenViewModelProtocol: ObservableObject {
    var movies: [Movie] { get }
}

struct MoviesScreen<ViewModel: MoviesScreenViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        NavigationView {
            List(viewModel.movies) { movie in
                NavigationLink(destination: destinationView(using: movie)) {
                    MovieListItem(movie: movie)
                        .padding(.trailing, 8)
                }
                .padding(.trailing, 16)
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Movies")
        }
        .navigationViewStyle(.stack)
    }

    func destinationView(using movie: Movie) -> some View {
        MovieDetailsScreen(viewModel: MovieDetailsScreenViewModel(movie: movie))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MoviesScreen(viewModel: MoviesScreenViewModelMock())
                .preferredColorScheme(.light)
            MoviesScreen(viewModel: MoviesScreenViewModelMock())
                .preferredColorScheme(.dark)
        }
    }
}
