import Common
import Foundation
import NetworkingLayer

enum MostPopularMovieMapper {
    typealias Str = Rsc.MostPopularMovieMapper

    static func convert(moviesDTO: MostPopularMoviesDTO, genresDTO: AllGenresDTO) -> [Movie] {
        moviesDTO.results.map {
            Movie(
                id: $0.id.description,
                title: $0.title,
                genres: $0.genreIds.compactMap { id in
                    genresDTO.genres.first { genre in
                        genre.id == id
                    }?.name
                }
                .joined(separator: .comma),
                overView: $0.overview,
                image: .init(
                    small: "\(Str.pictureUrl)\($0.posterPath)",
                    large: "\(Str.pictureUrl)\($0.backdropPath)"
                ),
                popularity: $0.popularity,
                isMarked: false
            )
        }
    }
}
