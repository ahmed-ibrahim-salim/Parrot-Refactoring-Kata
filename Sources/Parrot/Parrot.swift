import Foundation

class Parrot {
    private let type: ParrotType
    private let numberOfCoconuts: Int
    private let voltage: Double
    private let isNailed: Bool

    init(_ type: ParrotType, _ numberOfCoconuts: Int, _ voltage: Double, _ isNailed: Bool) {
        self.type = type
        self.numberOfCoconuts = numberOfCoconuts
        self.voltage = voltage
        self.isNailed = isNailed
    }

    func speed() -> Double {
        switch type {
        case .european:
            return baseSpeed

        case .african:
            return max(0, baseSpeed - loadFactor * Double(numberOfCoconuts))

        case .norwegianBlue:
            return isNailed ? 0 : baseSpeed(voltage: voltage)
        }
    }

    private func baseSpeed(voltage: Double) -> Double {
        min(24.0, voltage * baseSpeed)
    }

    private var loadFactor: Double {
        9.0
    }

    private var baseSpeed: Double {
        12.0
    }

    func getCry() -> String {
        var value: String
        switch type {
        case .european:
            value = "Sqoork!"
        case .african:
            value = "Sqaark!"
        case .norwegianBlue:
            value = voltage > 0 ? "Bzzzzzz" : "..."
        default:
            break
        }
        return value
    }

    static func makeParrot(_ type: ParrotType, _ numberOfCoconuts: Int, _ voltage: Double, _ isNailed: Bool) -> Parrot {
        switch type {
        case .european:
            return European(type, numberOfCoconuts, voltage, isNailed)

        case .african:
            return African(type, numberOfCoconuts, voltage, isNailed)

        case .norwegianBlue:
            return NorwegianBlue(type, numberOfCoconuts, voltage, isNailed)
        }
    }
}

class European: Parrot {
    // init( Int,  Double,  Bool) {
    //     self.init( numberOfCoconuts,  voltage,  isNailed)
    // }

    // override func speed() -> Double {
    //     baseSpeed
    // }
}

class African: Parrot {
    // init( Int,  Double,  Bool) {
    //     type = .african
    //     self.init( numberOfCoconuts,  voltage,  isNailed)
    // }

    // override func speed() -> Double {
    //     max(0, baseSpeed - loadFactor * Double(numberOfCoconuts))
    // }
}

class NorwegianBlue: Parrot {
    // init( Int,  Double,  Bool) {
    //     type = .norwegianBlue
    //     self.init( numberOfCoconuts,  voltage,  isNailed)
    // }

    // override func speed() -> Double {
    //     isNailed ? 0 : baseSpeed( voltage)
    // }
}
