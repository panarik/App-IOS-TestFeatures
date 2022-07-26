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

    static func enterKeys(_ element: XCUIElement, _ keys: String) {
        element.tap()
        var array: [String] = []
        for s in keys {
            array.append(s.lowercased())
        }
        array[0] = array[0].uppercased() // Screen keyboard suggest first letter as uppercase.
        for s in array {
            if s == " " {
                app.keys["space"].tap()
            }
            if let number = NumberFormatter().number(from: s) {
                app.keys["numbers"].tap()
                app.keys["\(number)"].tap()
                app.keys["letters"].tap()
            } else {
                app.keys[s].tap()
            }
        }
        app.buttons["Return"].tap()
//        app.keys["Return"].tap()
    }

    static func enterText(_ element: XCUIElement, _ text: String) {
        element.tap()
        element.typeText(text + "\n")
    }

    /*
     _____________________________________________________
    Locators:

        1. Simple:
        app.collectionViews.element
        app.maps.element
        app.navigationBars.element
        app.pickers.element
        app.progressIndicators.element
        app.scrollViews.element
        app.segmentedControls.element
        app.staticTexts.element
        app.switches.element
        app.tabBars.element
        app.tables.element
        app.textViews.element
        app.webViews.element

        2. Advanced queries:
        all buttons inside a specific scroll view (direct subviews only)
        - app.scrollViews["Main"].children(matching: .button)

        all buttons anywhere inside a specific scroll view (subviews, sub-subviews, sub-sub-subviews, etc)
        - app.scrollViews["Main"].descendants(matching: .button)

        find the first and fourth buttons
        - app.buttons.element(boundBy: 0)
        - app.buttons.element(boundBy: 3)


     ___________________________________________

     Interaction:

        1. For one element:
        doubleTap() taps twice in quick succession.
        twoFingerTap() uses two fingers to tap once on an element.
        tap(withNumberOfTaps:numberOfTouches:) lets you control tap and touch count at the same time.
        press(forDuration:) triggers long presses over a set number of seconds.
        swipeLeft(), swipeRight(), swipeUp(), swipeDown() execute single swipes in a specific direction, although there is no control over speed or distance.
        pinch(withScale:velocity:) pinches and zooms on something like a map. Specify scales between 0 and 1 to zoom out, or scales greater than 1 to zoom in. Velocity is specified as “scale factor per second” and causes a little overscroll after you zoom – use 0 to make the zoom precise.
        rotate(_: withVelocity:) rotates around an element. The first parameter is a CGFloat specifying an angle in radians, and the second is radians per second.

        2. For PickerWheel:
        adjust(toPickerWheelValue: 1) to make a picker scroll through to select a particular value.

        3. For sliders:
        adjust(toNormalizedSliderPosition: 0.5) to move it to a specific position.

     _______________________________________________________________________________

     Assertions:

        1. Attributes
        - app.buttons.element.title
        - app.staticTexts.element.label
        - app.textField.element.placeholderValue
        - app.textField.element.value

        2. Coordinates
        - app.buttons.element.frame

        3. Progress indicators (returns String with %)
        - app.progressIndicators.element.value
     */


}
