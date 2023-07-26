// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif

import Common

@testable import Movies















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

}
public final class MoviesScreenNavigationProtocolMock: MoviesScreenNavigationProtocol {
    public var onFinish: (() -> Void)?

public init() {}

}
