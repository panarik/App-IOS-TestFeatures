import XCTest

class MainPage: BasePage {

    // Fields
    let title = Control.app.navigationBars["Main menu"]
    let menuList = Control.app.tables["mainMenuList"]
    let menuListFirstItem = Control.app.tables["mainMenuList"].descendants(matching: .staticText).element(boundBy: 0)

    func onPage() {
        XCTAssertTrue(title.exists)
    }
    
    func checkMenuCount(with expected:Int) {
        let count:Int = menuList.children(matching: .cell).count // score from cells
        let count2:Int = menuList.descendants(matching: .staticText).count // score from TextViews descendances.
        XCTAssertEqual(count, count2)
        XCTAssertEqual(count, expected)
    }
    
    func openScreenByIndex(_ index: Int) {
        menuList.descendants(matching: .staticText).element(boundBy: index).tap() // TextViews descendances.
//        menuList.children(matching: .cell).element(boundBy: index).tap() // Cells
    }
    
    func openScreenByName(_ screenName: String) {
        menuList.descendants(matching: .staticText).element(matching: .staticText, identifier: screenName).tap()
    }

}
