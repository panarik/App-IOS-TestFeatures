import XCTest

class BaseTestClass: XCTestCase {

    //Properties
    var signedIn:Bool = false

    // Pages.
    var authPage = AuthPage()
    var alert = Alert()
    var main = MainPage()

    override func setUpWithError() throws {
        continueAfterFailure = false
        Control.launch(signedIn: signedIn) // Launch app with auth page.
    }

    override func tearDownWithError() throws {
    }

}
