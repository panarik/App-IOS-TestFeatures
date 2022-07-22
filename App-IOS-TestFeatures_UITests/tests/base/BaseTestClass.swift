import XCTest

class BaseTestClass: XCTestCase {

    // Pages.
    var authPage = AuthPage()
    var alert = Alert()

    override func setUpWithError() throws {
        continueAfterFailure = false
        Control.launch() // Launch app.
    }

    override func tearDownWithError() throws {
    }

}
