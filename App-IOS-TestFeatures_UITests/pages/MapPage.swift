import Foundation
import XCTest

class MapPage: BasePage {
    
    let map: XCUIElement = Control.app.otherElements["Map background"]
    let title: XCUIElement = Control.app.buttons["Title"]
    let mapMenu: XCUIElement = Control.app.tables["locations list"]
    
    func onPage() {
        XCTAssertTrue(title.waitForExistence(timeout: waitingSec),
                      "Map screen doesn't have a title.")
        XCTAssertTrue(map.waitForExistence(timeout: waitingSec),
                      "Map screen doesn't have a map.")
    }
    
    func chooseLocation(_ locationName: String) {
        title.tap()
        mapMenu.buttons[locationName].tap()
    }
    
    func checkTitle(_ title: String) {
        XCTAssertTrue(self.title.descendants(matching: .staticText).matching(identifier: title).element.waitForExistence(timeout: waitingSec))
    }
    
    func checkMapPins(_ pins: [String]) {
        for pinName in pins {
            map.descendants(matching: .button).matching(identifier: "MapPin " + pinName)
        }
      }
    
    func checkMapBackgroundElements(_ elements: [String]) {
        for element in elements {
            XCTAssertTrue(Control.app.maps.otherElements[element].waitForExistence(timeout: waitingSec))
        }
    }
    
    func checkMapMenuElements(_ elements: [String]) {
        for element in elements {
            XCTAssertTrue(mapMenu.buttons[element].waitForExistence(timeout: waitingSec))
        }
    }
    
}
