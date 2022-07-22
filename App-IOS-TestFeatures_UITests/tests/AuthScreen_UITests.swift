import XCTest

class Swift_IOS_FeaturesUITests: BaseTestClass {

    func test_loginSecure_exist() throws {
        // Given
        let logo = app.images["login-secure"]

        // Then
        XCTAssertTrue(logo.exists)
    }

    func test_SignUpButton_shouldSingUp() throws {
        // When
        authPage.enterName("name")
        authPage.enterEmail("email")
        authPage.enterPass("pass123")
        authPage.tapSignUpButton()

        // Then
        XCTAssertTrue(app.navigationBars["Main menu"].exists)
    }

    func test_PassTextField_shouldBeMoreThanSixChars() throws {
        // When
        authPage.enterPass("12345")
        authPage.tapSignUpButton()

        // Then
        alert.checkExist()
    }

    func test_PassAlert_shouldBeDismissed() throws {
        // When
        authPage.enterPass("12345")
        authPage.tapSignUpButton()
        alert.handle()

        // Then
        alert.checkNotExist()
    }

}
