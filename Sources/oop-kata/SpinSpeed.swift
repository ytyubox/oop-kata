import Foundation

class SpinSpeed {
    struct SpinSpeedError: LocalizedError {
        let errorDescription: String? = "Spin speed cannot be negative"
    }

    private static let NO_SPIN_SPEED:Int = 0;
    private final let rpm:Int;

    internal init(_ rpm: Int) throws {
        if (rpm < SpinSpeed.NO_SPIN_SPEED) {
            throw SpinSpeedError()
        }
        self.rpm = rpm
    }
    
    static func forRpm(_ value: Int) throws ->  SpinSpeed {
        return try SpinSpeed(value)
    }

    func isLowerOrEqual(_ anotherSpinSpeed: SpinSpeed ) -> Bool {
        return rpm <= anotherSpinSpeed.rpm;
    }
}
