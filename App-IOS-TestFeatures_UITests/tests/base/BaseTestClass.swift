import XCTest

class BaseTestClass: XCTestCase {

    var app: XCUIApplication! // Application.

    // Get pages.
    var authPage: AuthPage!
    var alert: Alert!

    override func setUpWithError() throws {
        continueAfterFailure = false
        let app = Controller().getApp()
        authPage = AuthPage(app)
        alert = Alert(app)
    }

    override func tearDownWithError() throws {
    }

}
