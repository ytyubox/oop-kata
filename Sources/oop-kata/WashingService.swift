import Foundation

class WashingService {

    private static let  MAX_LAUNDRY_WEIGHT:Decimal = 7

    func washWool(_ washingMachine: WashingMachine,
                  _ laundry: [LaundryElement],
                  _ spinSpeed: Int,
                  _ temperature: Int)  -> [LaundryElement] {
        let laundryToBeDone = maximumLoadFrom(laundry,. WOOL);
        washingMachine.laundry = (laundryToBeDone);
        if (spinSpeed >= 0 && spinSpeed <= 400) {
            washingMachine.spinSpeed = (spinSpeed);
        } else {
            washingMachine.spinSpeed = (400);
        }
        if (temperature >= 0 && temperature <= 40) {
            washingMachine.temperature = (temperature);
        } else {
            washingMachine.temperature = (40);
        }
        washingMachine.wash();
        return washingMachine.laundry
    }

    func washCotton(_ washingMachine: WashingMachine,
                  _ laundry: [LaundryElement],
                  _ spinSpeed: Int,
                  _ temperature: Int)  -> [LaundryElement] {
        let laundryToBeDone = maximumLoadFrom(laundry, .COTTON);
        washingMachine.laundry = (laundryToBeDone);
        if (spinSpeed >= 0 && spinSpeed <= 1200) {
            washingMachine.spinSpeed = (spinSpeed);
        } else {
            washingMachine.spinSpeed = (1200);
        }
        if (temperature >= 0 && temperature <= 95) {
            washingMachine.temperature = (temperature);
        } else {
            washingMachine.temperature = (95);
        }
        washingMachine.wash();
        return washingMachine.laundry
    }

    func washSilk(_ washingMachine: WashingMachine,
                  _ laundry: [LaundryElement],
                  _ spinSpeed: Int,
                  _ temperature: Int)  -> [LaundryElement] {
        let laundryToBeDone = maximumLoadFrom(laundry, .SILK);
        washingMachine.laundry = (laundryToBeDone);
        if (spinSpeed >= 0 && spinSpeed <= 300) {
            washingMachine.spinSpeed = (spinSpeed);
        } else {
            washingMachine.spinSpeed = (300);
        }
        if (temperature >= 0 && temperature <= 30) {
            washingMachine.temperature = (temperature);
        } else {
            washingMachine.temperature = (30);
        }
        washingMachine.wash();
        return washingMachine.laundry
    }

    private func maximumLoadFrom(
        _ laundry: Array<LaundryElement>,
        _ fabricType: Fabric) -> [LaundryElement] {
        var laundryToBeDone = [LaundryElement]()
        laundry
            .filter {
                laundryElement in laundryElement.type == fabricType
            }
            .forEach{nextLaundryElement in
                   if (canFitAnotherLaundry(laundryToBeDone, nextLaundryElement)) {
                       laundryToBeDone.append(nextLaundryElement);
                   }
            };
        return laundryToBeDone;
    }

    private func canFitAnotherLaundry(
        _ laundryToBeDone: Array<LaundryElement>,
        _ nextLaundryElement: LaundryElement) -> Bool {
        return totalWeightOf(laundryToBeDone)
            .adding(nextLaundryElement.weight)
            .compareTo(WashingService.MAX_LAUNDRY_WEIGHT);
    }

    private func totalWeightOf(_ laundry: [LaundryElement]) -> Decimal {
        return laundry
            .map(\.weight)
            .reduce(0, +)
    }
}

extension Decimal {
    func adding(_ other: Decimal) -> Decimal {
        self + other
    }
    func compareTo(_ other: Decimal) -> Bool {
        self == other
    }
}
