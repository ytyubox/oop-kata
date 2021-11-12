import AppKit
class Basket {
    private var laundry: Laundry;

    private init(_ laundry: Laundry) {
        self.laundry = laundry
    }
    
    static func empty() -> Basket {
        return Basket(Laundry.of([]))
    }

    func put(_ newLaundryToBeDoen: Laundry) {
        laundry = laundry.with(newLaundryToBeDoen)
    }

    func takeOutWool() -> Laundry {
        let woolElements = laundryOf(LaundryElement.WoolLaundryElement.self);
        laundry = laundry.withOut(woolElements);
        return woolElements;
    }

    func takeOutCotton() -> Laundry {
        let cottonElements = laundryOf(LaundryElement.CottonLaundryElement.self);
        laundry = laundry.withOut(cottonElements);
        return cottonElements;
    }

    func takeOutSilk() -> Laundry {
        let silkElements = laundryOf(LaundryElement.SilkLaundryElement.self);
        laundry = laundry.withOut(silkElements);
        return silkElements;
    }

    private func laundryOf<L: LaundryElement>(_ elementType: L.Type) -> Laundry {
        return Laundry.of(laundry.asList()
                            .filter{
            (element:LaundryElement) -> Bool in
            element is L    
        })
    }
}
