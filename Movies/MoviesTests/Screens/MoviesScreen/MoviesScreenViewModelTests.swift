import Common
@testable import Movies
import XCTest

class MoviesScreenViewModelTests: XCTestCase {
    private var sut: MoviesScreenViewModel!

    private var navigation: MoviesScreenNavigationProtocolMock!
    private var repository: MoviesRepositoryProtocolMock!
    private var overlayManager: OverlayManagerProtocol!

    override func setUpWithError() throws {
        try super.setUpWithError()

        navigation = .init()
        repository = .init()
        overlayManager = OverlayManagerMock()

        setupSut()
    }

    override func tearDownWithError() throws {
        sut = nil

        try super.tearDownWithError()
    }

    private func setupSut() {
        sut = MoviesScreenViewModel(
            navigation: navigation,
            repository: repository,
            overlayManager: overlayManager
        )
    }

    func test_onAppear_shouldCallGetMostPopularMovies() async {
        repository.getMostPopularMoviesStub = {
            Movie.movieListMock
        }

        await sut.fetchMovies()

        XCTAssertTrue(repository.getMostPopularMoviesCalled)
        XCTAssertEqual(repository.getMostPopularMoviesCallsCount, 1)
        XCTAssertEqual(sut.movies, Movie.movieListMock)
    }
}
