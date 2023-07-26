// swiftlint:disable function_parameter_count
public protocol Logger {
    init(subsystem: String, appLogsEnabled: Bool)

    func log<T: CustomStringConvertible>(
        level: Logging.Level,
        category: Logging.Category,
        message: T,
        file: String,
        function: String,
        line: Int
    )
}
// swiftlint:enable function_parameter_count

public extension Logger {
    func debug<T: CustomStringConvertible>(
        _ message: T,
        category: Logging.Category,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        log(level: .debug, category: category, message: message, file: file, function: function, line: line)
    }

    func info<T: CustomStringConvertible>(
        _ message: T,
        category: Logging.Category,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        log(level: .info, category: category, message: message, file: file, function: function, line: line)
    }

    func error<T: CustomStringConvertible>(
        _ message: T,
        category: Logging.Category,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        log(level: .error, category: category, message: message, file: file, function: function, line: line)
    }

    func critical<T: CustomStringConvertible>(
        _ message: T,
        category: Logging.Category,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        log(level: .critical, category: category, message: message, file: file, function: function, line: line)
    }
}
