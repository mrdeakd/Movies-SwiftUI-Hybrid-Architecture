import Foundation

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
                Str.NetworkError.invalidUrl,
                comment: Str.NetworkError.invalidUrlComment
            )
        case .invalidServerResponse:
            return NSLocalizedString(
                Str.NetworkError.invalidServerResponse,
                comment: Str.NetworkError.invalidServerResponseComment
            )
        case .notFound:
            return NSLocalizedString(
                Str.NetworkError.notFound,
                comment: Str.NetworkError.notFoundComment
            )
        }
    }
}
