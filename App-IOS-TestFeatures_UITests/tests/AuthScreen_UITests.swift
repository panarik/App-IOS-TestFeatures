import XCTest

class Swift_IOS_FeaturesUITests: BaseTestClass {

    func test_loginSecure_exist() throws {

        // Then
        authPage.checkExistLogo()
    }

    func test_SignUpButton_shouldSingUp() throws {
        // When
        authPage.enterName("name")
        authPage.enterEmail("email")
        authPage.enterPass("pass123")
        authPage.tapSignUpButton()

        // Then

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
