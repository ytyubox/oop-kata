import Foundation
import Metal
class Laundry {
    
    private final var  allLaundry: List<LaundryElement>;
    
    private init(_ allLaundry: List<LaundryElement> ) {
        self.allLaundry = allLaundry;
    }
    
    static func of(_ allLaundry: List<LaundryElement> ) -> Laundry {
        return  Laundry(allLaundry);
    }
    
    func asList() -> List<LaundryElement> {
        return allLaundry
    }
    
    func with(_ LaundryToBeDone: Laundry) -> Laundry {
        var updatedLaundry: List<LaundryElement> = Array(allLaundry);
        updatedLaundry.append(contentsOf: LaundryToBeDone.asList());
        return Laundry.of(updatedLaundry);
    }
    
    func with(_  LaundryToBeDone: LaundryElement) -> Laundry {
        var updatedLaundry: List<LaundryElement> =  Array(allLaundry);
        updatedLaundry.append(LaundryToBeDone);
        return Laundry.of(updatedLaundry);
    }
    
    func withOut(_  removedElements: Laundry) -> Laundry {
        var updatedLaundry:List<LaundryElement> =  Array(allLaundry);
        updatedLaundry.removeAll(removedElements.asList())
        return Laundry.of(updatedLaundry);
    }
    
    func weight() -> Decimal {
        return allLaundry
            .map(\.weight)
            .reduce(.zero, +);
    }
}
