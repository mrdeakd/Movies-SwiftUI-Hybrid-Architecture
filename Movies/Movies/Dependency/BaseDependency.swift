import UIKit

public protocol BaseDependency {
    func makeRootNavigationController() -> UINavigationController
}

public extension BaseDependency {
    func makeRootNavigationController() -> UINavigationController {
        UINavigationController()
    }
}
