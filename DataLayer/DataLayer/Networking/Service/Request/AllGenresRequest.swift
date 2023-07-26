import Foundation
import NetworkingLayer

public final class AllGenresRequest: RequestProtocol {
    public typealias ApiResponse = AllGenresDTO

    public let requestType: RequestType = .GET
    public let path: String
    public let urlParams: [String: String?]

    public init() {
        self.path = ApiPaths.allGenres
        self.urlParams = [ApiConstants.apiKey: ApiConstants.apiKeyValue]
    }
}
