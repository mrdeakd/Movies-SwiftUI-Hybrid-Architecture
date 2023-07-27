import Foundation
import NetworkingLayer

public final class MostPopularMoviesRequest: RequestProtocol {
    public typealias ApiResponse = MostPopularMoviesDTO

    public let requestType: RequestType = .GET
    public let path: String
    public let urlParams: [String: String?]

    public init() {
        self.path = ApiPaths.mostPopularMovies
        self.urlParams = [ApiConstants.apiKey: ApiConstants.apiKeyValue]
    }
}
