import Darwin

class Temperature {
   
    private static let CELSIUS_FREEZING_POINT_OF_WATER: Int = 0;

    private final let  celsiusValue: Integer;

    internal init(_ celsiusValue: Integer) {
        self.celsiusValue = celsiusValue
    }
    
    static func celsius(_ value: Integer) -> Temperature {
        return  Temperature(value);
    }

    func isOverFreezingPoint() -> Bool {
        return celsiusValue >  Temperature.CELSIUS_FREEZING_POINT_OF_WATER;
    }

    func isLowerOrEqual( anotherTemperature: Temperature) -> Bool {
        return celsiusValue <= anotherTemperature.celsiusValue;
    }
}
