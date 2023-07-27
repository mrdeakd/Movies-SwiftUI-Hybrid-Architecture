import Foundation

public enum ApiConstants {
    static let host = "https://api.themoviedb.org/3"

    public static let apiKey = "api_key"
    public static let apiKeyValue = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
}
