import XCTest

class MainPage: BasePage {

    // Fields
    let title = Control.app.navigationBars["Main menu"]

    func onPage() {
        XCTAssertTrue(title.exists)
    }

}
