
class Cleaner {

    func doLaundry(_ laundrySupplier: Supplier<Laundry>,
                   _ programmeSupplier:Supplier<Programme>) {
        let washingMachine = WashingMachine();
        let laundryBasket = getLaundryBasket();
        let programme = programmeSupplier()
                                               .adjustTemperature(getRequestedTemperature())
                                               .adjustSpinSpeed(getRequestedSpinSpeed());

        let unfittedLaundry = washingMachine.addLaundry(laundrySupplier());
        washingMachine.selectProgramme(programme);
        washingMachine.start();

        laundryBasket.put(unfittedLaundry);
    }

    private func  getLaundryBasket() -> Basket {
        let laundryBasket = Basket.empty();
        // fill the laundryBasket with available laundry by any way, e.g. obtaining it from repositories, providers, services
        return laundryBasket;
    }

    private func getRequestedTemperature() -> Temperature{
        return Temperature.celsius(Int.nextInt(95));
    }

    private func getRequestedSpinSpeed() -> SpinSpeed {
        return try! SpinSpeed.forRpm(Int.nextInt(1200));
    }
}
typealias Supplier<T> = () -> T
