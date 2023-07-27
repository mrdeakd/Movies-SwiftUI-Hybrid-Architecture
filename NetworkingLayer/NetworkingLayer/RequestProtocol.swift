import Foundation
import Utils

public protocol RequestProtocol {
    associatedtype ApiResponse: Response

    var host: String { get }
    var path: String { get }
    var headers: [String: String] { get }
    var params: [String: Any] { get }
    var urlParams: [String: String?] { get }
    var addAuthorizationToken: Bool { get }
    var requestType: RequestType { get }
}

public extension RequestProtocol {
    var host: String {
        ApiConstants.host
    }

    var addAuthorizationToken: Bool {
        false
    }

    var authToken: String {
        .empty
    }

    var params: [String: Any] {
        [:]
    }

    var urlParams: [String: String?] {
        [:]
    }

    var headers: [String: String] {
        [:]
    }

    func createURLRequest() throws -> URLRequest {
        var components = URLComponents()
        components.path = path

        if !urlParams.isEmpty {
            components.queryItems = urlParams.map {
                URLQueryItem(name: $0, value: $1)
            }
        }

        guard
            let componentsURL = components.url,
            let url = URL(string: "\(host)\(componentsURL)")
        else {
            throw NetworkError.invalidURL
        }

        var urlRequest = URLRequest(url: url)

        urlRequest.httpMethod = requestType.rawValue

        if !headers.isEmpty {
            urlRequest.allHTTPHeaderFields = headers
        }

        if addAuthorizationToken {
            urlRequest.setValue(authToken, forHTTPHeaderField: "Authorization")
        }

        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if !params.isEmpty {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params)
        }

        AppLogger.shared.info(urlRequest, category: .network)

        return urlRequest
    }
}
