import XCTest

class MainPage: BasePage {

    // Fields
    let title = Control.app.navigationBars["Main menu"]

    func checkExist() {
        XCTAssertTrue(title.exists)
    }

}
