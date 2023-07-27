import Common
import SwiftUI
import UI

struct MoviesScreenView<ViewModel: MoviesScreenViewModelProtocol>: View {
    typealias Str = Rsc.MoviesScreenView

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        NavigationView {
            List(viewModel.movies) { movie in
                MovieListItemView(movie: movie)
                    .padding(.trailing, .s8)
                    .onTapGesture { viewModel.navigateToMovieDetails(movie) }
                    .padding(.trailing, .s16)
                    .listRowInsets(EdgeInsets())
            }
            .navigationTitle(Str.Navigation.title)
        }
        .navigationViewStyle(.stack)
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
