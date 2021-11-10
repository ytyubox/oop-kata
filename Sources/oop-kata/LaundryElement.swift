import Foundation
class LaundryElement {

    public var type: Fabric
    public var color: String
    public var weight: Decimal
    public var dirty: Bool
    
    internal init(type: Fabric, color: String, weight: Decimal, dirty: Bool) {
        self.type = type
        self.color = color
        self.weight = weight
        self.dirty = dirty
    }
    
}
