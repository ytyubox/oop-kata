import Darwin

class WashingController {
    
    private let  washingService: WashingService
    
    public init(washingService: WashingService) {
        self.washingService = washingService
    }
    
    
    func wash( fabricType: Fabric) {
        let laundry = getAllLaundry();
        let washingMachine:WashingMachine = WashingMachine()
        let spinSpeed = getRequestedSpinSpeed();
        let temperature = getRequestedTemperature();
        if (fabricType == Fabric.WOOL) {
            _ = washingService.washWool(washingMachine, laundry, spinSpeed, temperature);
        } else if (fabricType == .COTTON) {
            _ = washingService.washCotton(washingMachine, laundry, spinSpeed, temperature);
        } else if (fabricType == .SILK) {
            _ = washingService.washSilk(washingMachine, laundry, spinSpeed, temperature);
        }
    }
    
    private func getAllLaundry() -> [LaundryElement] {
        let allLaundry = Array<LaundryElement>()
        // fill the allLaundry collection with available laundry by any way, e.g. obtaining it from repositories, providers, services
        return allLaundry;
    }
    
    private func getRequestedSpinSpeed() -> Int {
        return Int.nextInt(1200);
    }
    
    private func getRequestedTemperature() -> Int {
        return Int.nextInt(95);
    }
    
}

extension Int {
    static func nextInt(_ u: Int) -> Int {
        (0..<u).randomElement()!
    }
}
