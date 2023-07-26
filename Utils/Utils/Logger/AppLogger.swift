import Foundation
import os.log

public final class AppLogger: Logger {
    public static let shared = AppLogger()

    private let subsystem: String
    private let appLogsEnabled: Bool
    private var loggers = [Logging.Category: OSLog]()

    private func osLog(
        level: Logging.Level,
        category: Logging.Category,
        message: String,
        file: String,
        function: String,
        line: Int
    ) {
        DispatchQueue.main.async {
            if self.loggers[category] == nil {
                self.loggers[category] = OSLog(subsystem: self.subsystem, category: category.rawValue)
            }

            guard let logger = self.loggers[category] else { return }
            logger(level: level, message: message, file: file, function: function, line: line)
        }
    }

    public func log<T: CustomStringConvertible>(
        level: Logging.Level,
        category: Logging.Category,
        message: T,
        file: String,
        function: String,
        line: Int
    ) {
        guard appLogsEnabled else { return }
        osLog(
            level: level,
            category: category,
            message: message.description,
            file: file,
            function: function,
            line: line
        )
    }

    public init(subsystem: String = Bundle.main.displayName ?? .empty, appLogsEnabled: Bool = true) {
        self.subsystem = subsystem
        self.appLogsEnabled = appLogsEnabled
    }
}
