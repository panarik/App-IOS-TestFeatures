import XCTest

class AuthScreen_UITests: BaseTestClass {

    func test_loginSecure_exist() throws {
        // Then
        authPage.checkExistLogo()
    }

    func test_SignUpButton_shouldSingUp() throws {
        // When
        authPage.enterName("name")
                .enterEmail("email")
                .enterPass("pass123")
                .tapSignUpButton()

        // Then
        main.onPage()
    }

    func test_PassTextField_shouldBeMoreThanSixChars() throws {
        // When
        authPage.enterPass("12345")
                .tapSignUpButton()

        // Then
        alert.checkExist()
    }

    func test_PassAlert_shouldBeDismissed() throws {
        // When
        authPage.enterPass("12345")
                .tapSignUpButton()
        alert.handle()

        // Then
        alert.checkNotExist()
    }

}
