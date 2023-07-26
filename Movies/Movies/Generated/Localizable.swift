// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Rsc {
  internal enum Error {
    internal enum Default {
      /// Check the error and try again
      internal static let title = Rsc.tr("Localizable", "Error.default.title", fallback: "Check the error and try again")
    }
  }
  internal enum InfoItemView {
    /// xmark
    internal static let xmark = Rsc.tr("Localizable", "InfoItemView.xmark", fallback: "xmark")
  }
  internal enum MovieDetailsScreenView {
    internal enum Overview {
      /// Overview
      internal static let title = Rsc.tr("Localizable", "MovieDetailsScreenView.overview.title", fallback: "Overview")
    }
    internal enum Plus {
      /// plus
      internal static let name = Rsc.tr("Localizable", "MovieDetailsScreenView.plus.name", fallback: "plus")
    }
    internal enum Star {
      /// star.fill
      internal static let name = Rsc.tr("Localizable", "MovieDetailsScreenView.star.name", fallback: "star.fill")
    }
  }
  internal enum MovieListItemView {
    internal enum Star {
      /// star.fill
      internal static let name = Rsc.tr("Localizable", "MovieListItemView.star.name", fallback: "star.fill")
    }
  }
  internal enum MoviesScreenView {
    internal enum Navigation {
      /// Movies
      internal static let title = Rsc.tr("Localizable", "MoviesScreenView.navigation.title", fallback: "Movies")
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
