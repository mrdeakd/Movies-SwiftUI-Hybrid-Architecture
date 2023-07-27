import Common
import SwiftUI
import UI

struct MoviesScreenView<ViewModel: MoviesScreenViewModelProtocol>: View {
    typealias Str = Rsc.MoviesScreenView

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        NavigationView {
            List($viewModel.movies) { $movie in
                NavigationLink(destination: destinationView(using: $movie)) {
                    MovieListItemView(movie: movie)
                        .padding(.trailing, .s8)
                        //.onTapGesture { viewModel.navigateToMovieDetails($movie) }
                }
                .padding(.trailing, .s16)
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle(Str.Navigation.title)
        }
        .navigationViewStyle(.stack)
        .task {
            viewModel.fetchMoviesPublisher()
            //Task { await fetchMovies() }
        }
    }

    func destinationView(using movie: Binding<Movie>) -> some View {
        MovieDetailsScreenView(
            viewModel: MovieDetailsScreenViewModel(
                navigation: MovieDetailsNavigation(),
                movie: movie
            )
        )
    }
}

struct MoviesScreenView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MoviesScreenView(viewModel: MoviesScreenViewModelMock())
                .preferredColorScheme(.light)
            MoviesScreenView(viewModel: MoviesScreenViewModelMock())
                .preferredColorScheme(.dark)
        }
    }
}
