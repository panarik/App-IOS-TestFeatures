import Foundation
import XCTest

class AuthPage {

    private let app: XCUIApplication

    private let nameField: XCUIElement
    private let emailField: XCUIElement
    private let passField: XCUIElement
    private let continueButton: XCUIElement

    init(_ inputApp: XCUIApplication) {
        app = inputApp
        nameField = app.textFields["NameTextField"]
        emailField = app.textFields["EmailTextField"]
        passField = app.textFields["PassTextField"]
        continueButton = app.buttons["SignUpButton"]
    }

    func enterName(_ text:String) {
        nameField.tap()
        app.typeText(text)
    }

    func enterEmail(_ text:String) {
        emailField.tap()
        app.typeText(text)
    }

    func enterPass(_ text:String) {
        passField.tap()
        app.typeText(text)
    }

    func tapSignUpButton() {
        continueButton.tap()
    }

}
