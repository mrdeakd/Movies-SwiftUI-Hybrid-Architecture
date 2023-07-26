import OSLog

extension OSLogType {
    static func from(loggerLevel: Logging.Level) -> Self {
        switch loggerLevel {
        case .debug:
            return .debug
        case .info:
            return .info
        case .error:
            return .error
        case .critical:
            return .fault
        }
    }
}
