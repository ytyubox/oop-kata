import Foundation

class LaundryElement {
    
    var color: String
    var weight: Decimal
    var _dirty: Bool
    
    private static let IS_CLEAN:Bool = TRUE;
    internal init(_ color: String,_ weight: Decimal,_ dirty: Bool) {
        self.color = color
        self.weight = weight
        self._dirty = dirty
    }
    
    func clean() {
        self._dirty = FALSE;
    }
    
    func dirty() {
        self._dirty = TRUE;
    }
    
    static func wool( color:String,  weight: Decimal) -> LaundryElement {
        return  WoolLaundryElement(color, weight, IS_CLEAN);
    }
    
    static func cotton( color: String,  weight: Decimal) -> LaundryElement {
        return  CottonLaundryElement(color, weight, IS_CLEAN);
    }
    
    static func silk( color: String,  weight: Decimal) -> LaundryElement {
        return  SilkLaundryElement(color, weight, IS_CLEAN);
    }
    
    
    
    class WoolLaundryElement: LaundryElement {}
    
    class CottonLaundryElement: LaundryElement {}
    
    class SilkLaundryElement : LaundryElement {}
}


