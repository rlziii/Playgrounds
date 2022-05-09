import XCTest

class XCTest_PlaygroundUITests: XCTestCase {

    override func setUpWithError() throws {
        // Set up.

        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Tear down.
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()

        // ...
    }
}
