import XCTest

class BaseTestClass: XCTestCase {

    // Get pages.
    var authPage: AuthPage!
    var alert: Alert!

    override func setUpWithError() throws {
        continueAfterFailure = false
        Control.launch()
        authPage = AuthPage()
        alert = Alert()
    }

    override func tearDownWithError() throws {
    }

}
