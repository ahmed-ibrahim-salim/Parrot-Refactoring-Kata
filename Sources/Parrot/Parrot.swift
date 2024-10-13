import Foundation

class Parrot {
    private let type: ParrotType
    let numberOfCoconuts: Int
    let voltage: Double
    let isNailed: Bool

    init(_ type: ParrotType, _ numberOfCoconuts: Int, _ voltage: Double, _ isNailed: Bool) {
        self.type = type
        self.numberOfCoconuts = numberOfCoconuts
        self.voltage = voltage
        self.isNailed = isNailed
    }

    func speed() -> Double { 0.0 }

    func baseSpeed(voltage: Double) -> Double {
        min(24.0, voltage * baseSpeed)
    }

    var loadFactor: Double {
        9.0
    }

    var baseSpeed: Double {
        12.0
    }

    func getCry() -> String { "" }

    static func makeParrot(_ type: ParrotType, _ numberOfCoconuts: Int, _ voltage: Double, _ isNailed: Bool) -> Parrot {
        switch type {
        case .european:
            return European(numberOfCoconuts, voltage, isNailed)

        case .african:
            return African(numberOfCoconuts, voltage, isNailed)

        case .norwegianBlue:
            return NorwegianBlue(numberOfCoconuts, voltage, isNailed)
        }
    }
}

class European: Parrot {
    init(_ numberOfCoconuts: Int, _ voltage: Double, _ isNailed: Bool) {
        super.init(.european, numberOfCoconuts, voltage, isNailed)
    }

    override func getCry() -> String {
        return "Sqoork!"
    }

    override func speed() -> Double {
        baseSpeed
    }
}

class African: Parrot {
    init(_ numberOfCoconuts: Int, _ voltage: Double, _ isNailed: Bool) {
        super.init(.african, numberOfCoconuts, voltage, isNailed)
    }

    override func getCry() -> String {
        return "Sqaark!"
    }

    override func speed() -> Double {
        max(0, baseSpeed - loadFactor * Double(numberOfCoconuts))
    }
}

class NorwegianBlue: Parrot {
    init(_ numberOfCoconuts: Int, _ voltage: Double, _ isNailed: Bool) {
        super.init(.norwegianBlue, numberOfCoconuts, voltage, isNailed)
    }

    override func getCry() -> String {
        return voltage > 0 ? "Bzzzzzz" : "..."
    }

    override func speed() -> Double {
        isNailed ? 0 : baseSpeed(voltage: voltage)
    }
}
