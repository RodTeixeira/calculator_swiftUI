//
//  calculatorTests.swift
//  calculatorTests
//
//  Created by Rodolfo on 26/08/23.
//

import XCTest
@testable import calculator

final class calculatorTests: XCTestCase {
    
    func testInputNumber() {
        let sut = makeSut()
        sut.receiveInput(value: .one)
        sut.receiveInput(value: .zero)
        XCTAssertEqual(sut.display, "10")
    }
    
    func testAddition() {
        let sut = makeSut()
        sut.receiveInput(value: .one)
        sut.receiveInput(value: .plus)
        sut.receiveInput(value: .two)
        sut.receiveInput(value: .equals)
        XCTAssertEqual(sut.display, "3")
    }
    
    func testSubtraction() {
        let sut = makeSut()
        sut.receiveInput(value: .five)
        sut.receiveInput(value: .minus)
        sut.receiveInput(value: .three)
        sut.receiveInput(value: .equals)
        XCTAssertEqual(sut.display, "2")
    }
    
    func testMultiplication() {
        let sut = makeSut()
        sut.receiveInput(value: .two)
        sut.receiveInput(value: .multiply)
        sut.receiveInput(value: .three)
        sut.receiveInput(value: .equals)
        XCTAssertEqual(sut.display, "6")
    }
    
    func testDivision() {
        let sut = makeSut()
        sut.receiveInput(value: .nine)
        sut.receiveInput(value: .divider)
        sut.receiveInput(value: .three)
        sut.receiveInput(value: .equals)
        XCTAssertEqual(sut.display, "3")
    }
    
    func testClear() {
        let sut = makeSut()
        sut.receiveInput(value: .five)
        sut.receiveInput(value: .ac)
        XCTAssertEqual(sut.display, "")
    }
    
    func testInvertSign() {
        let sut = makeSut()
        sut.receiveInput(value: .five)
        sut.receiveInput(value: .plusMinus)
        XCTAssertEqual(sut.display, "-5")
    }
    
    
    func testDecimalPoint() {
        let sut = makeSut()
        sut.receiveInput(value: .three)
        sut.receiveInput(value: .dot)
        sut.receiveInput(value: .five)
        XCTAssertEqual(sut.display, "3,5")
    }
    
    func testPercentage() {
        let sut = makeSut()
        sut.receiveInput(value: .eight)
        sut.receiveInput(value: .porcent)
        XCTAssertEqual(sut.display, "0.08")
    }
    
    func testInvalidOperation() {
        let sut = makeSut()
        sut.receiveInput(value: .five)
        sut.receiveInput(value: .plus)
        sut.receiveInput(value: .equals)
        XCTAssertEqual(sut.display, "5")
    }
    
    func testMultipleEquals() {
        let sut = makeSut()
        sut.receiveInput(value: .three)
        sut.receiveInput(value: .plus)
        sut.receiveInput(value: .three)
        sut.receiveInput(value: .equals)
        sut.receiveInput(value: .equals)
        XCTAssertEqual(sut.display, "9")
    }
    
}

extension calculatorTests {
    func makeSut() -> CalculatorViewModel {
        return CalculatorViewModel()
    }
}
