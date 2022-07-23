import Foundation
import XCTest

class Control {

    static let app = XCUIApplication()

    private init() {
    }

    static func launch(signedIn: Bool) {
        if signedIn {
            app.launchArguments = ["-UITest_StartSignedIn"]
        }
        app.launch()
    }

}
