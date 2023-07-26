// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Rsc {
  internal enum Error {
    /// Server problem, please try again later!
    internal static let networkErrorInvalidServerResponse = Rsc.tr("Localizable", "error.network_error_invalid_server_response", fallback: "Server problem, please try again later!")
    /// invalidServerResponse
    internal static let networkErrorInvalidServerResponseComment = Rsc.tr("Localizable", "error.network_error_invalid_server_response_comment", fallback: "invalidServerResponse")
    /// Invalid URL {--} Developer Error
    internal static let networkErrorInvalidUrl = Rsc.tr("Localizable", "error.network_error_invalid_url", fallback: "Invalid URL {--} Developer Error")
    /// invalidURL
    internal static let networkErrorInvalidUrlComment = Rsc.tr("Localizable", "error.network_error_invalid_url_comment", fallback: "invalidURL")
    /// Can't find items for this search!
    internal static let networkErrorNotFound = Rsc.tr("Localizable", "error.network_error_not_found", fallback: "Can't find items for this search!")
    /// notFound
    internal static let networkErrorNotFoundComment = Rsc.tr("Localizable", "error.network_error_not_found_comment", fallback: "notFound")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Rsc {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
