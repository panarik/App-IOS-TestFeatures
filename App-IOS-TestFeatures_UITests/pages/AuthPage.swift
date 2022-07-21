import XCTest

class AuthPage: BasePage {

    // Fields
    private var nameField: XCUIElement!
    private var emailField: XCUIElement!
    private var passField: XCUIElement!
    private var continueButton: XCUIElement!

    init(_ app: XCUIApplication) {
        super.init(app: app)
        nameField = app.textFields["NameTextField"]
        emailField = app.textFields["EmailTextField"]
        passField = app.textFields["PassTextField"]
        continueButton = app.buttons["SignUpButton"]
    }

    func enterName(_ text: String) {
        nameField.tap()
        app.typeText(text)
    }

    func enterEmail(_ text: String) {
        emailField.tap()
        app.typeText(text)
    }

    func enterPass(_ text: String) {
        passField.tap()
        app.typeText(text)
    }

    func tapSignUpButton() {
        continueButton.tap()
    }

}
