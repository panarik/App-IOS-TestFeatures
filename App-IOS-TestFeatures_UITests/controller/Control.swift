import Foundation
import XCTest

class Control {

    static let app = XCUIApplication()

    private init() {
    }

    static func launch() {
        app.launch()
    }

}
