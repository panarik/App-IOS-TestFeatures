import XCTest

class MainScreen_UITests: BaseScenarios {

    func test_menuCount_shouldBeFive() {
        //Then
        main.checkMenuCount(with: 5)
    }
    
    func test_menu_shouldOpenPages() {
        //When
        main.openScreenByName("Music player")
        
        //Then
        player.onPage()
    }

}
