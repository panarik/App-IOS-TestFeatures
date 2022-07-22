import XCTest

class Alert: BasePage {

    private var alert: XCUIElement!

    init(_ app: XCUIApplication) {
        super.init(app: app)
        alert = app.alerts.firstMatch
    }

    func checkExist() {
        XCTAssertTrue(alert.waitForExistence(timeout: 5))
    }

    func checkNotExist() {
        XCTAssertFalse(alert.exists)
    }

    func handle() {
        if alert.exists {
            let okButton = alert.scrollViews.otherElements.buttons["OK"]
            okButton.waitForExistence(timeout: 1)
            okButton.tap()
        }
    }

}
