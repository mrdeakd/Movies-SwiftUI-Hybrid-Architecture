import Foundation
import Utils

public class APIManager: APIManagerProtocol {
    private let urlSession: URLSession

    public init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    public func perform(_ request: any RequestProtocol) async throws -> Data {
        let (data, response) = try await urlSession.data(for: request.createURLRequest())

        AppLogger.shared.info(String(decoding: data, as: UTF8.self), category: .network)
        AppLogger.shared.info(response, category: .network)

        if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
            switch httpResponse.statusCode {
            case 404:
                AppLogger.shared.error(
                    NetworkError.notFound.localizedDescription,
                    category: .network
                )
                throw NetworkError.notFound
            default:
                AppLogger.shared.error(
                    NetworkError.invalidServerResponse.localizedDescription,
                    category: .network
                )
                throw NetworkError.invalidServerResponse
            }
        }

        return data
    }
}
