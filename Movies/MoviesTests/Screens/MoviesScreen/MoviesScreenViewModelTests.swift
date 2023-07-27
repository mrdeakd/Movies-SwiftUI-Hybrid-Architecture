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

        setupInitialRepositoryStubs()
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

    private func setupInitialRepositoryStubs() {
        repository.getMostPopularMoviesStub = {
            Movie.movieListMock
        }
    }

    func test_fetchMovies_shouldGetMostPopularMoviesFromAsync() async {
        /// Given
        sut.movies = []

        /// When
        await sut.fetchMovies()

        /// Then
        XCTAssertTrue(repository.getMostPopularMoviesCalled)
        XCTAssertEqual(repository.getMostPopularMoviesCallsCount, 2)
        XCTAssertEqual(sut.movies, Movie.movieListMock)
    }

    func test_onViewModelInit_shouldGetMostPopularMoviesFromPublisher() {
        /// Given
        let getMostPopularMoviesStubCalled = XCTestExpectation(description: "Call getMostPopularMoviesStub")
        sut.movies = []

        repository.getMostPopularMoviesPublisherStub = {
            getMostPopularMoviesStubCalled.fulfill()
            return Just(Movie.movieListMock)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }

        /// When
        sut.fetchMoviesPublisher()

        /// Then
        wait(for: [getMostPopularMoviesStubCalled])
        XCTAssertTrue(repository.getMostPopularMoviesPublisherCalled)
        XCTAssertEqual(repository.getMostPopularMoviesPublisherCallsCount, 1)
        XCTAssertEqual(sut.movies, Movie.movieListMock)
    }
}
