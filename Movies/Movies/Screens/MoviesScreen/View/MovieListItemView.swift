import Common
import SwiftUI
import UI
import Utils

private enum MovieListItemViewLayout {
    static let movieImageSize = CGSize(width: 80, height: 80 * 1.7778)
    static let favouriteImageSize = CGSize(width: 24, height: 24)
    static let titleLineLimit = 2
    static let genreLineLimit = 1
}

private enum MovieListItemViewConstants {
    static let popularityDivide: Float = 10
    static let popularityTotal: Float = 1_000
}

struct MovieListItemView: View {
    typealias Str = Rsc.MovieListItemView

    let movie: Movie

    var body: some View {
        HStack(spacing: .s16) {
            ZStack {
                AsyncImageView(url: movie.image.small)
                    .frame(
                        width: MovieListItemViewLayout.movieImageSize.width,
                        height: MovieListItemViewLayout.movieImageSize.height
                    )
                    .clipped()
            }
            VStack(alignment: .leading, spacing: .s4) {
                HStack {
                    if movie.isMarked {
                        Image(systemName: Str.Star.name)
                            .resizable()
                            .frame(
                                width: MovieListItemViewLayout.favouriteImageSize.width,
                                height: MovieListItemViewLayout.favouriteImageSize.height
                            )
                            .foregroundColor(.yellow)
                            .shadow(color: .yellow, radius: .s4)
                    }
                    Text(movie.title)
                        .font(.headline)
                        .lineLimit(MovieListItemViewLayout.titleLineLimit)
                }
                Text(movie.genres)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .lineLimit(MovieListItemViewLayout.genreLineLimit)
                HStack {
                    ProgressView(
                        value: movie.popularity / MovieListItemViewConstants.popularityDivide,
                        total: MovieListItemViewConstants.popularityTotal
                    )
                    Text(movie.popularity.asStringWithOneDecimal)
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                .layoutPriority(1)
            }
        }
    }
}

struct MovieListItem_Previews: PreviewProvider {
    static var previews: some View {
        MovieListItemView(movie: .movieListMock[1])
    }
}
