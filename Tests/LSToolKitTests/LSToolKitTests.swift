import XCTest
@testable import LSToolKit

final class LSToolKitTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(LSToolKit().text, "Hello, World!")
    }

    // test version conpare
    func testVersionCompare() throws {
        let current = "2.0"
        let support = "1.1.3"
        
        XCTAssertTrue(current.isVersionSupported(support: support))
    }
}
