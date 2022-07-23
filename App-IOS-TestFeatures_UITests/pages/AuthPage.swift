import XCTest

class AuthPage: BasePage {

    // Fields
    let logoImage = Control.app.images["loginImage"]
    let nameField = Control.app.textFields["NameTextField"]
    let emailField = Control.app.textFields["EmailTextField"]
    let passField = Control.app.textFields["PassTextField"]
    let continueButton = Control.app.buttons["SignUpButton"]

    func enterName(_ text: String) -> AuthPage {
        Control.enterText(nameField, text)
        return self
    }

    func enterEmail(_ text: String) -> AuthPage {
        Control.enterText(emailField, text)
        return self
    }

    func enterPass(_ text: String) -> AuthPage {
        Control.enterKeys(passField, text)
        return self
    }

    func tapSignUpButton() {
        continueButton.tap()
    }

    func checkExistLogo() {
        XCTAssertTrue(logoImage.exists)
    }

}
