import Foundation
extension Decimal {
    func adding(_ other: Decimal) -> Decimal {
        self + other
    }
    func compareTo(_ other: Decimal) -> Decimal {
        self - other
    }
}

extension  Array {
    mutating func removeAll<C>(_ c: C) where Element: AnyObject, C: Collection, C.Element == Element {
        removeAll(where: { element in
            c.contains { e in
                e === element
            }
        })
    }
}
extension Int {
    static func nextInt(_ u: Int) -> Int {
        (0..<u).randomElement()!
    }
}
let FALSE = false
let TRUE = true
typealias Integer = Int
typealias List = Array
