import Foundation
import XCTest

class BaseTestClass: XCTestCase {

    var app: XCUIApplication! // Application.

    // Get pages.
    var authPage: AuthPage!


    override func setUpWithError() throws {
        continueAfterFailure = false
        app = Controller().getApp() // Get application.
        authPage = AuthPage(app) // Create page.
    }

    override func tearDownWithError() throws {
    }

}
