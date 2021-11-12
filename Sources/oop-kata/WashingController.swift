import Darwin
class WashingController {
    internal init(cleaner: Cleaner) {
        self.cleaner = cleaner
    }
    
    private final let cleaner: Cleaner;

    func washWool() {
        let laundryBasket = getLaundryBasket();
        cleaner.doLaundry(laundryBasket.takeOutWool, Programme.forWool);
    }

    func washCotton() {
        let laundryBasket = getLaundryBasket();
        cleaner.doLaundry(laundryBasket.takeOutCotton, Programme.forCotton);
    }

    func washSilk() {
        let laundryBasket = getLaundryBasket();
        cleaner.doLaundry(laundryBasket.takeOutSilk, Programme.forSilk);
    }

    private func getLaundryBasket() -> Basket {
        let laundryBasket = Basket.empty();
        return laundryBasket;
    }

}
