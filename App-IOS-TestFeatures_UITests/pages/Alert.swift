import XCTest

class Alert: BasePage {

    private var alert: XCUIElement

    override init() {
        alert = Control.app.alerts.firstMatch
        super.init()
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
