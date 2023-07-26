import Foundation
import Utils

enum NetworkError: Error {
    case invalidURL
    case invalidServerResponse
    case notFound
}

extension NetworkError: LocalizedError {
    typealias Str = Rsc.Error

    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString(
                Str.networkErrorInvalidUrl,
                comment: Str.networkErrorInvalidUrlComment
            )
        case .invalidServerResponse:
            return NSLocalizedString(
                Str.networkErrorInvalidServerResponse,
                comment: Str.networkErrorInvalidServerResponseComment
            )
        case .notFound:
            return NSLocalizedString(
                Str.networkErrorNotFound,
                comment: Str.networkErrorNotFoundComment
            )
        }
    }
}
