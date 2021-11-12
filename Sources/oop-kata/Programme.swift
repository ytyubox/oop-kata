
/// abstract
class Programme {
    
    
    private let  temperature: Temperature;
    private let  spinSpeed: SpinSpeed;
    private init(_ temperature: Temperature,_ spinSpeed: SpinSpeed) {
        self.temperature = temperature
        self.spinSpeed = spinSpeed
    }
    
    
    
    static func forWool() -> Programme {
        return  WoolProgramme();
    }
    
    static func forCotton() -> Programme{
        return  CottonProgramme();
    }
    
    static func forSilk() -> Programme {
        return  SilkProgramme();
    }
    
    func adjustTemperature(_ temperature: Temperature) -> Programme{
        return programmeFor(temperature, spinSpeed);
    }
    
    func adjustSpinSpeed(_ spinSpeed:SpinSpeed) -> Programme {
        return programmeFor(temperature, spinSpeed);
    }
    
    func isValid(_ temperature: Temperature) -> Bool {
        return temperature.isOverFreezingPoint() && temperature.isLowerOrEqual(anotherTemperature: maximumTemperature());
    }
    
    func isValid(_ spinSpeed:SpinSpeed) -> Bool {
        return spinSpeed.isLowerOrEqual(maximumSpinSpeed());
    }
    
    func maximumTemperature() -> Temperature {fatalError()}
    func maximumSpinSpeed() -> SpinSpeed {fatalError()}
    func programmeFor(_ temperature:Temperature,_  spinSpeed: SpinSpeed) -> Programme {fatalError()}
    
    
    private  class WoolProgramme : Programme {
        
        private static  let MAX_TEMERATURE:Temperature = Temperature.celsius(40);
        public static   let MAX_SPIN_SPEED:SpinSpeed = try! SpinSpeed.forRpm(400);
        
        convenience init() {
            self.init(Self.MAX_TEMERATURE, Self.MAX_SPIN_SPEED);
            
        }
        
        
        override func maximumTemperature() -> Temperature  {
            return Self.MAX_TEMERATURE;
        }
        
        
        override func maximumSpinSpeed() -> SpinSpeed {
            return Self.MAX_SPIN_SPEED;
        }
        
        
        override func  programmeFor(_ temperature: Temperature,_ spinSpeed:SpinSpeed) -> Programme {
            return  WoolProgramme(temperature, spinSpeed);
        }
    }
    
    private  class CottonProgramme : Programme {
        
        private static let  MAX_TEMERATURE:Temperature = Temperature.celsius(95);
        public static let  MAX_SPIN_SPEED:SpinSpeed = try! SpinSpeed.forRpm(1200);
        
        convenience init() {
            self.init(Self.MAX_TEMERATURE, Self.MAX_SPIN_SPEED);
        }
        
        
        
        override func maximumTemperature() -> Temperature  {
            return Self.MAX_TEMERATURE;
        }
        
        
        override func maximumSpinSpeed() -> SpinSpeed {
            return Self.MAX_SPIN_SPEED;
        }
        
        
        override func  programmeFor(_ temperature: Temperature,_ spinSpeed:SpinSpeed) -> Programme {
            return  CottonProgramme(temperature, spinSpeed);
        }
    }
    
    private  class SilkProgramme : Programme {
        
        private static let  MAX_TEMERATURE:Temperature = Temperature.celsius(30);
        public static let  MAX_SPIN_SPEED:SpinSpeed = try! SpinSpeed.forRpm(300);
        
        convenience init() {
            self.init(Self.MAX_TEMERATURE,Self.MAX_SPIN_SPEED);
        }
        
        
        override func maximumTemperature() -> Temperature {
            return Self.MAX_TEMERATURE;
        }
        
        
        override func maximumSpinSpeed() -> SpinSpeed {
            return Self.MAX_SPIN_SPEED;
        }
        
        
        override func programmeFor(_ temperature: Temperature,_ spinSpeed:SpinSpeed) -> Programme {
            return  SilkProgramme(temperature, spinSpeed);
        }
    }
}
