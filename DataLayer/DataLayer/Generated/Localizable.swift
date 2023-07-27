// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Rsc {
  internal enum MostPopularMovieMapper {
    /// https://image.tmdb.org/t/p/original/
    internal static let pictureUrl = Rsc.tr("Localizable", "MostPopularMovieMapper.pictureUrl", fallback: "https://image.tmdb.org/t/p/original/")
  }
  internal enum Error {
    internal enum NetworkError {
      /// Missing data from network call
      internal static let missingData = Rsc.tr("Localizable", "error.networkError.missingData", fallback: "Missing data from network call")
      /// missingData
      internal static let missingDataComment = Rsc.tr("Localizable", "error.networkError.missingDataComment", fallback: "missingData")
    }
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
