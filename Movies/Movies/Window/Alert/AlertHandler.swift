import Foundation

public final class AlertHandler: ObservableObject {
    @Published private(set) var nextAlert: AlertHandler.Item?

    private(set) var queue = Set<AlertHandler.Item>()
    private(set) var timer: Timer?

    public init() {}

    @MainActor
    func addItemToAlertQueue(item: AlertHandler.Item) {
        queue.insert(item)

        if timer == nil {
            timer = Timer.scheduledTimer(
                timeInterval: 1.0,
                target: self,
                selector: #selector(removeItemFromQueue),
                userInfo: nil,
                repeats: true
            )
        }
    }

    // swiftlint:disable attributes
    @MainActor
    @objc func removeItemFromQueue() {
        if queue.isEmpty {
            timer?.invalidate()
            timer = nil
        }
        if self.nextAlert == nil {
            if let nextAlert = queue.popFirst() {
                self.nextAlert = nextAlert
                hideAfter(delay: nextAlert.delay)
            }
        }
    }
    // swiftlint:enable attributes

    func hideAfter(delay: Int = 0) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) { [weak self] in
            self?.nextAlert = nil
        }
    }
}

public extension AlertHandler {
    struct Item: Hashable {
        var title: String
        var message: String?
        var delay: Int = .zero
        var didFinish: (() -> Void)?

        public init(
            title: String,
            message: String? = nil,
            delay: Int = .zero,
            didFinish: (() -> Void)? = nil
        ) {
            self.title = title
            self.message = message
            self.delay = delay
            self.didFinish = didFinish
        }

        public static func == (lhs: AlertHandler.Item, rhs: AlertHandler.Item) -> Bool {
            lhs.title == rhs.title &&
            lhs.message == rhs.message &&
            lhs.delay == rhs.delay
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(title)
            hasher.combine(message)
        }
    }
}
