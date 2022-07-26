import XCTest

class BaseTestClass: XCTestCase {

    //Properties
    var signedIn:Bool = true

    // Pages.
    var authPage = AuthPage()
    var alert = Alert()
    var main = MainPage()
    var player = PlayerPage()

    override func setUpWithError() throws {
        continueAfterFailure = false
        Control.launch(signedIn: signedIn) // Launch app with auth page.
    }

    override func tearDownWithError() throws {
    }

}
