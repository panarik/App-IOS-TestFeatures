import XCTest

class Swift_IOS_FeaturesUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
    }

    func test_AuthView_loginSecure_exist() throws {
        // Given
        let logo = app.images["login-secure"]
        
        // Then
        XCTAssertTrue(logo.exists)
    }
    
    func test_UITestingView_continueButton_shouldThrowToNextScreen() throws {
        // Given
        let continueButton = app.buttons["Continue"]
        
        // When
        
        // Then
        
    }

}
