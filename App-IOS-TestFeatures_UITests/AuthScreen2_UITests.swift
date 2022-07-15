import XCTest



class App_IOS_TestFeaturesUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func test_UITestingView_singUpButton_shouldNotSignIn() throws {
    
    }
    
    func test_UITestingView_singUpButton_shouldSignIn() throws {
    
    }

}
