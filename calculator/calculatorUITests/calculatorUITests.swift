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
        // Interagir com os botões na interface do usuário
        app.buttons["1"].tap()
        app.buttons["+"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
        
        // Verificar o resultado na tela
        XCTAssert(app.staticTexts["3"].exists)
    }
}
