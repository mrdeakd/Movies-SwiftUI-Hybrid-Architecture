import Foundation

public enum DataLayerError: Error {
    case missingData
}

extension DataLayerError: LocalizedError {
    typealias Str = Rsc.Error

    public var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString(
                Str.NetworkError.missingData,
                comment: Str.NetworkError.missingDataComment
            )
        }
    }
}
