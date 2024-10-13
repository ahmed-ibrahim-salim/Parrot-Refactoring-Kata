@testable import Parrot
import XCTest

class ParrotTests: XCTestCase {
    func testSpeedOfEuropeanParrot() throws {
        let parrot = Parrot.makeParrot(.european, 0, 0.0, false)
        XCTAssertEqual(parrot.speed(), 12.0)
    }

    func testSpeedOfAfricanParrot_with_one_coconut() throws {
        let parrot = Parrot.makeParrot(.african, 1, 0.0, false)
        XCTAssertEqual(parrot.speed(), 3.0)
    }

    func testSpeedOfAfricanParrot_with_two_coconuts() throws {
        let parrot = Parrot.makeParrot(.african, 2, 0.0, false)
        XCTAssertEqual(parrot.speed(), 0.0)
    }

    func testSpeedOfAfricanParrot_with_no_coconuts() throws {
        let parrot = Parrot.makeParrot(.african, 0, 0.0, false)
        XCTAssertEqual(parrot.speed(), 12.0)
    }

    func testSpeedOfNorwegianBlueParrot_nailed() throws {
        let parrot = Parrot.makeParrot(.norwegianBlue, 0, 0.0, true)
        XCTAssertEqual(parrot.speed(), 0.0)
    }

    func testSpeedOfNorwegianBlueParrot_not_nailed() throws {
        let parrot = Parrot.makeParrot(.norwegianBlue, 0, 1.5, false)
        XCTAssertEqual(parrot.speed(), 18.0)
    }

    func testSpeedOfNorwegianBlueParrot_not_nailed_high_voltage() throws {
        let parrot = Parrot.makeParrot(.norwegianBlue, 0, 4.0, false)
        XCTAssertEqual(parrot.speed(), 24.0)
    }

    public func testgetCryOfEuropeanParrot() throws {
        let parrot = Parrot.makeParrot(.european, 0, 0, false)
        XCTAssertEqual("Sqoork!", parrot.getCry())
    }

    public func testgetCryOfAfricanParrot() throws {
        let parrot = Parrot.makeParrot(.african, 2, 0, false)
        XCTAssertEqual("Sqaark!", parrot.getCry())
    }

    public func testgetCryNorwegianBlueParrot_high_voltage() throws {
        let parrot = Parrot.makeParrot(.norwegianBlue, 0, 4, false)
        XCTAssertEqual("Bzzzzzz", parrot.getCry())
    }

    public func testgetCryNorwegianBlueParrot_no_voltage() throws {
        let parrot = Parrot.makeParrot(.norwegianBlue, 0, 0, false)
        XCTAssertEqual("...", parrot.getCry())
    }
}
