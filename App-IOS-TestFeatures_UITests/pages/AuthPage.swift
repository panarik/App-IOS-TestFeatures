import XCTest

class AuthPage: BasePage {

    // Fields
    private var logoImage: XCUIElement
    private var nameField: XCUIElement
    private var emailField: XCUIElement
    private var passField: XCUIElement
    private var continueButton: XCUIElement

    override init() {
        logoImage = Control.app.images["login-secure"]
        nameField = Control.app.textFields["NameTextField"]
        emailField = Control.app.textFields["EmailTextField"]
        passField = Control.app.textFields["PassTextField"]
        continueButton = Control.app.buttons["SignUpButton"]
        super.init()
    }

    func enterName(_ text: String) {
        nameField.tap()
        Control.app.typeText(text)
    }

    func enterEmail(_ text: String) {
        emailField.tap()
        Control.app.typeText(text)
    }

    func enterPass(_ text: String) {
        passField.tap()
        Control.app.typeText(text)
    }

    func tapSignUpButton() {
        continueButton.tap()
    }

    func checkExistLogo() {
        XCTAssertTrue(logoImage.exists)
    }

}
