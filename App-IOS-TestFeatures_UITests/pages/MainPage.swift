import XCTest

class MainPage: BasePage {

    private var title: XCUIElement

    override init() {
        title = Control.app.navigationBars["Main menu"]
    }

    func checkExist() {
        XCTAssertTrue(title.exists)
    }

}
