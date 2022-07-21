import XCTest

class Alert: BasePage {

    private var wrongPass: XCUIElement!

    init(_ app: XCUIApplication) {
        super.init(app: app)
        wrongPass = app.alerts["Wrong password length"]
    }

    func isExist() {
        XCTAssertTrue(wrongPass.exists)
    }

    func isNotExist() {
        XCTAssertFalse(wrongPass.exists)
    }

    func handle() {
        let okButton = wrongPass.scrollViews.otherElements.buttons["OK"]
        okButton.waitForExistence(timeout: 1)
        okButton.tap()
    }

}
