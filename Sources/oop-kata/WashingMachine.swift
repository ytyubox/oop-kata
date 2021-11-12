import Foundation
class WashingMachine {
    
    
    private static let  MAX_LAUNDRY_WEIGHT:Decimal = (7);
    
    private var programme:Programme!;
    private var laundry:Laundry!;
    


    func selectProgramme(_  programme:Programme) {
        self.programme = programme;
    }

    func takeOutLaundry() -> Laundry {
        return laundry
    }

    func addLaundry(_ newLaundryToBeDone: Laundry) -> Laundry {
        newLaundryToBeDone.asList()
            .forEach{
                nextLaundryElement in
                if (canFit(nextLaundryElement)) {
                    laundry = laundry.with(nextLaundryElement);
                }
            };
        return newLaundryToBeDone.withOut(laundry);
    }

    func start() {
        laundry.asList().forEach {
                laundryElement in laundryElement.clean()
            }
    }

    private func canFit(_ nextLaundryElement:LaundryElement) -> Bool {
        return laundry.weight()
            .adding(nextLaundryElement.weight)
            .compareTo(Self.MAX_LAUNDRY_WEIGHT) <= 0;
    }

}
