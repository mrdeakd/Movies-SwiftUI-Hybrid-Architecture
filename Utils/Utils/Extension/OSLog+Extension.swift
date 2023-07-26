import OSLog

// swiftlint:disable legacy_objc_type
extension OSLog {
    func callAsFunction(level: Logging.Level, message: String, file: String, function: String, line: Int) {
        os_log(
            "\n%@ %@\n➯ %@: %@ - line:%d\n➯ %s \n\n",
            log: self,
            type: OSLogType.from(loggerLevel: level),
            level.icon,
            level.rawValue.uppercased(),
            (file as NSString).lastPathComponent,
            function,
            line,
            message
        )
    }
}
// swiftlint:enable legacy_objc_type
