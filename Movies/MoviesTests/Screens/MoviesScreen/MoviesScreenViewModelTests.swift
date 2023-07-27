import Combine
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

    private func setupRepositoryStubs() {
        sut = MoviesScreenViewModel(
            navigation: navigation,
            repository: repository,
            overlayManager: overlayManager
        )
    }

    func test_onInit_shouldGetMostPopularMoviesFromAsync() async {
        repository.getMostPopularMoviesStub = {
            Movie.movieListMock
        }
        repository.getMostPopularMoviesPublisherStub = {
            Just(Movie.movieListMock)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }

        await sut.fetchMovies()

        XCTAssertTrue(repository.getMostPopularMoviesCalled)
        XCTAssertEqual(repository.getMostPopularMoviesCallsCount, 1)
        XCTAssertEqual(sut.movies, Movie.movieListMock)
    }

    func test_onInit_shouldGetMostPopularMoviesFromPublisher() {
        repository.getMostPopularMoviesPublisherStub = {
            Just(Movie.movieListMock)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }

        sut.fetchMoviesPublisher()

        XCTAssertTrue(repository.getMostPopularMoviesPublisherCalled)
        XCTAssertEqual(repository.getMostPopularMoviesPublisherCallsCount, 1)
        XCTAssertEqual(sut.movies, Movie.movieListMock)
    }
}
