import XCTest
@testable import XCTest_Playground

class XCTest_PlaygroundTests: XCTestCase {
    override func setUpWithError() throws {
        // Set up.
    }

    override func tearDownWithError() throws {
        // Tear down.
    }

    func testOnePlusOne() throws {
        XCTAssertEqual(1 + 1, 2)
    }
}
