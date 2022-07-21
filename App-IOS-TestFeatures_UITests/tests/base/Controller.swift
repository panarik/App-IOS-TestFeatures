import Foundation
import XCTest

class Controller {

    private let app = XCUIApplication()

    init() {
        app.launch()
    }

    func getApp() -> XCUIApplication {
        app
    }

}
