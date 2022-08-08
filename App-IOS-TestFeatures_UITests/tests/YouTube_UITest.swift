//
//  YouTube_UITest.swift
//  App-IOS-TestFeatures_UITests
//
//  Created by panarik on 8/7/22.
//

import XCTest

class YouTube_UITest: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        app = XCUIApplication(bundleIdentifier: "com.google.ios.youtube")
        continueAfterFailure = false
}

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        app.launch()
        
    }
    
}
