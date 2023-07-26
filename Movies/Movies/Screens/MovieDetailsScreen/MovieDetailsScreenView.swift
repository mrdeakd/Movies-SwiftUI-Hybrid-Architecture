import Common
import Foundation
import SwiftUI

private enum MovieDetailsScreenViewLayout {
    static let imageSize = CGSize(width: 24, height: 24)
    static let aspectRatio: CGFloat = 0.7
    static let opacity: CGFloat = 0.001
    static let offset: CGFloat = -100
}

struct MovieDetailsScreenView<ViewModel: MovieDetailsScreenViewModelProtocol>: View {
    typealias Str = Rsc.MovieDetailsScreenView

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        ScrollView {
            Color.clear
                .aspectRatio(MovieDetailsScreenViewLayout.aspectRatio, contentMode: .fill)
                .overlay(AsyncImageView(url: viewModel.movie.image.large))
                .clipped()
                .overlay {
                    LinearGradient(
                        colors: [
                            Color(uiColor: .systemBackground).opacity(MovieDetailsScreenViewLayout.opacity),
                            Color(uiColor: .systemBackground)
                        ],
                        startPoint: .center,
                        endPoint: .bottom
                    )
                }

            VStack(spacing: .s16) {
                Button(action: { viewModel.markMovie() }) {
                    Image(systemName: viewModel.movie.isMarked ? "star.fill" : "plus")
                    .resizable()
                    .frame(
                        width: MovieDetailsScreenViewLayout.imageSize.width,
                        height: MovieDetailsScreenViewLayout.imageSize.height
                    )
                    .foregroundColor(viewModel.movie.isMarked ? .yellow : .black)
                }
                .padding(.s8)
                .background(Material.regularMaterial)
                .cornerRadius(.s8)
                .shadow(radius: .s24)

                Text(Str.Overview.title)
                    .font(.title)
                    .fontWeight(.bold)
                Text(viewModel.movie.overView)
                    .font(.body)
            }
            .offset(y: MovieDetailsScreenViewLayout.offset)
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(viewModel.movie.title)
    }
}

struct MovieDetailsScreem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovieDetailsScreenView(viewModel: MovieDetailsScreenViewModelMock())
                .preferredColorScheme(.light)
            MovieDetailsScreenView(viewModel: MovieDetailsScreenViewModelMock())
                .preferredColorScheme(.dark)
        }
    }
}
