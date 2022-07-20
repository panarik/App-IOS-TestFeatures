import XCTest

class Swift_IOS_FeaturesUITests: BaseTestClass {

    func test_AuthView_loginSecure_exist() throws {
        // Given
        let logo = app.images["login-secure"]

        // Then
        XCTAssertTrue(logo.exists)
    }

    func test_UITestingView_SignUpButton_shouldSingUp() throws {

        // When
        authPage.enterName("name")
        authPage.enterEmail("email")
        authPage.enterPass("pass")
        authPage.tapSignUpButton()

        // Then
        XCTAssertTrue(app.navigationBars["Main menu"].exists)
    }

}
