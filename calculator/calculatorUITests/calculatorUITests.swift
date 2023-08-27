//
//  calculatorUITests.swift
//  calculatorUITests
//
//  Created by Rodolfo on 26/08/23.
//

import XCTest

final class calculatorUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testAddingNumbers() {
        app.buttons["1"].tap()
        app.buttons["+"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
        XCTAssert(app.staticTexts["3"].exists)
    }
}
