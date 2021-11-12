import XCTest
@testable import oop_kata

final class oop_kataTests: XCTestCase {
    func testArrayDeleteAllSyncWithAnyObject() throws {
        var vector = (0...4).map{_ in NSObject()}
        vector.removeAll(vector)
        XCTAssertEqual(vector, [])
    }
    
    func testArrayDeleteAllSyncWithAnyObjectWithOneMore() throws {
        var vector = (0...4).map{_ in NSObject()}
        let toDelete = vector
        let toAdd = NSObject()
        vector.append(toAdd)
        vector.removeAll(toDelete)
        XCTAssertEqual(vector, [toAdd])
        let first = try XCTUnwrap(vector.first)
        XCTAssertTrue(first === toAdd)
    }
}
