import XCTest

class Alert: BasePage {

    // Fields
    let alert = Control.app.alerts.firstMatch

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
