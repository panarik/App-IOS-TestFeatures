import XCTest

class PlayerView_UITests: BaseScenarios {


    func test_volumeSlider_shouldChangeVolume() throws {
        
        // Given
        main.openScreenByName("Music player")
        player.onPage()
        
        
        // When
        player.setVolume(50)
        
        // Then
        
        
//
//
//
//        let app = XCUIApplication()
//        app/*@START_MENU_TOKEN@*/.textFields["NameTextField"]/*[[".textFields[\"Your name\"]",".textFields[\"NameTextField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//
//        let emailtextfieldTextField = app/*@START_MENU_TOKEN@*/.textFields["EmailTextField"]/*[[".textFields[\"Your email\"]",".textFields[\"EmailTextField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        emailtextfieldTextField.tap()
//        emailtextfieldTextField.tap()
//        emailtextfieldTextField.tap()
//
//        let passtextfieldTextField = app/*@START_MENU_TOKEN@*/.textFields["PassTextField"]/*[[".textFields[\"Your password\"]",".textFields[\"PassTextField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        passtextfieldTextField.tap()
//        passtextfieldTextField.tap()
//
//        let signupbuttonButton = app/*@START_MENU_TOKEN@*/.buttons["SignUpButton"]/*[[".buttons[\"Sign Up\"]",".buttons[\"SignUpButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        signupbuttonButton.tap()
//        app.alerts["Wrong password length"].scrollViews.otherElements.buttons["OK"].tap()
//        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.tap()
//        signupbuttonButton.tap()
//        app.tables.cells["Music player"].children(matching: .other).element(boundBy: 0).children(matching: .other).element.tap()
//
//        let volumeSliderSlider = app.sliders["Volume slider"]
//        volumeSliderSlider.swipeRight()
//        app.staticTexts["Volume: 51"].tap()
//        app.buttons["Play"].tap()
//        app.buttons["Pause"].tap()
//        volumeSliderSlider.swipeRight()
//        volumeSliderSlider/*@START_MENU_TOKEN@*/.press(forDuration: 1.1);/*[[".tap()",".press(forDuration: 1.1);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//
//
    }

}
