import Common
import SwiftUI

struct MoviesScreenView<ViewModel: MoviesScreenViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel

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
        .onAppear { viewModel.onAppear() }
    }

    func destinationView(using movie: Movie) -> some View {
        MovieDetailsScreen(viewModel: MovieDetailsScreenViewModel(movie: movie))
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
