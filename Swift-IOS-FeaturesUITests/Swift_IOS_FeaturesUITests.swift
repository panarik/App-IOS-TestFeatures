//
//  Swift_IOS_FeaturesUITests.swift
//  Swift-IOS-FeaturesUITests
//
//  Created by panarik on 6/5/22.
//

import XCTest

class Swift_IOS_FeaturesUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCheckElements() throws {
        let logo = app.images["login-secure"]
        
        // Check
        XCTAssertTrue(logo.exists)
    }
    
    func testCkickButtons() throws {
        let nameTextField = app.textFields["Your Name"]
        let emailTextField = app.textFields["Your Email"]
        let passTextField = app.textFields["Your Password"]
        
        // Step 1: Enter username
        nameTextField.tap()
        nameTextField.typeText("user")
        
        // Step 2: Enter email
        emailTextField.tap()
        emailTextField.typeText("test@mail.com")
        
        // Step 3: Enter pass
        passTextField.tap()
        passTextField.typeText("password")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
