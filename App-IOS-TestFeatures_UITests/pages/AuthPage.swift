import XCTest

class AuthPage: BasePage {

    // Fields
    let logoImage = Control.app.images["loginImage"]
    let nameField = Control.app.textFields["NameTextField"]
    let emailField = Control.app.textFields["EmailTextField"]
    let passField = Control.app.textFields["PassTextField"]
    let continueButton  = Control.app.buttons["SignUpButton"]

    func enterName(_ text: String) -> AuthPage {
        nameField.tap()
        Control.app.typeText(text)
        return self
    }

    func enterEmail(_ text: String) -> AuthPage {
        emailField.tap()
        Control.app.typeText(text)
        return self
    }

    func enterPass(_ text: String) -> AuthPage {
        passField.tap()
        Control.app.typeText(text)
        return self
    }

    func tapSignUpButton() {
        continueButton.tap()
    }

    func checkExistLogo() {
        XCTAssertTrue(logoImage.exists)
    }

}
