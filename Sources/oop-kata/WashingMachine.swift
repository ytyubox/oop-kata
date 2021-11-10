
class WashingMachine {
    

    public var temperature: Int;
    public var spinSpeed: Int;
    public var laundry: [LaundryElement]

    public init(temperature: Int = 0, spinSpeed: Int = 0, laundry: [LaundryElement] = []) {
        self.temperature = temperature
        self.spinSpeed = spinSpeed
        self.laundry = laundry
    }

    func wash() {
        laundry.forEach{
            laundryElement in
            laundryElement.dirty = false
        }
    }
}
