// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif

import Combine
import Common
import SwiftUI
















public final class MovieDetailsNavigationProtocolMock: MovieDetailsNavigationProtocol {
    public var onFinish: (() -> Void)?

public init() {}

}
public final class MoviesRepositoryProtocolMock: MoviesRepositoryProtocol {

public init() {}

    //MARK: - getMostPopularMovies

    public var getMostPopularMoviesThrowableError: Error?
    public var getMostPopularMoviesCallsCount = 0
    public var getMostPopularMoviesCalled: Bool {
        getMostPopularMoviesCallsCount > 0
    }
    public var getMostPopularMoviesReturnValue: [Movie]!
    public var getMostPopularMoviesStub: (() async throws -> [Movie])?

    public func getMostPopularMovies() async throws -> [Movie] {
        if let error = getMostPopularMoviesThrowableError {
            throw error
        }
        getMostPopularMoviesCallsCount += 1
        if let getMostPopularMoviesStub = getMostPopularMoviesStub {
            return try await getMostPopularMoviesStub()
        } else {
            return getMostPopularMoviesReturnValue
        }
    }

    //MARK: - getMostPopularMoviesPublisher

    public var getMostPopularMoviesPublisherCallsCount = 0
    public var getMostPopularMoviesPublisherCalled: Bool {
        getMostPopularMoviesPublisherCallsCount > 0
    }
    public var getMostPopularMoviesPublisherReturnValue: AnyPublisher<[Movie], Error>!
    public var getMostPopularMoviesPublisherStub: (() -> AnyPublisher<[Movie], Error>)?

    public func getMostPopularMoviesPublisher() -> AnyPublisher<[Movie], Error> {
        getMostPopularMoviesPublisherCallsCount += 1
        if let getMostPopularMoviesPublisherStub = getMostPopularMoviesPublisherStub {
            return getMostPopularMoviesPublisherStub()
        } else {
            return getMostPopularMoviesPublisherReturnValue
        }
    }

}
public final class MoviesScreenNavigationProtocolMock: MoviesScreenNavigationProtocol {
    public var onFinish: (() -> Void)?
    public var onNavigateToMovieDetails: ((Binding<Movie>) -> Void)?

public init() {}

}
