import XCTest
@testable import LSToolKit

final class LSToolKitTests: XCTestCase {
    
    // test version conpare
    func testVersionCompare() throws {
        let current = "1.1.4"
        let support = "1.1.3"
        
        XCTAssertTrue(current.isVersionSupported(support: support))
    }
}
