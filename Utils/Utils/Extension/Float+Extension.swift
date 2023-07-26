import Foundation

public extension Float {
    var asStringWithOneDecimal: String {
        String(format: "%.1f", self)
    }
}
