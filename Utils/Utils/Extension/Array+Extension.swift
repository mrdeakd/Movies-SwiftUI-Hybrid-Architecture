public extension Array {
    mutating func modifyElement(
        atIndex index: Index,
        _ modifyElement: (_ element: inout Element) -> Void
    ) {
        var element = self[index]
        modifyElement(&element)
        self[index] = element
    }
}
