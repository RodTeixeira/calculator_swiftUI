//
//  CalculatorViewModel.swift
//  calculator
//
//  Created by Rodolfo on 26/08/23.
//

import Foundation
import SwiftUI

enum CalculatorButton: String {
    case zero, one, two, three, four, five, six, seven, eight, nine
    case equals ,plus, minus, multiply, divider
    case dot
    case ac, plusMinus, porcent
    
    var title: String {
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .equals: return "="
        case .plus: return "+"
        case .minus: return "-"
        case .multiply: return "X"
        case .divider: return "÷"
        case .ac: return "AC"
        case .plusMinus: return "±"
        case .porcent: return "%"
        case .dot: return "."
        }
    }
    
    var background: Color {
        switch self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .dot:
            return Color(.darkGray)
        case .ac, .plusMinus, .porcent:
            return Color(.lightGray)
        default:
            return .orange
            
        }
    }
}

class CalculatorViewModel: ObservableObject {
    @Published var display = String.empty
    
    var buttons: [[CalculatorButton]] = [
        [.ac, .plusMinus, .porcent, .divider],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .dot, .equals]
    ]
    
    private var firstNumber: Float = .zero
    private var secondNumber: Float = .zero
    private var operand: CalculatorButton = .ac
    private var currentNumber: String = String.empty
    private var result: Float = .zero
    
    func receiveInput(value: CalculatorButton) {
        switch value {
        case .ac:
            clearCalculator()
        case .equals:
            calculateResult()
        case .plus, .minus, .multiply, .divider:
            setOperand(value)
        case .dot:
            addDecimalPoint()
        case .plusMinus:
            invertSign()
        case .porcent:
            calculatePercentage()
        default:
            appendNumber(value)
        }
    }
    
    private func clearCalculator() {
        currentNumber = .empty
        firstNumber = .zero
        secondNumber = .zero
        operand = .ac
        result = .zero
        display = String.empty
    }
    
    private func setOperand(_ value: CalculatorButton) {
        if currentNumber.isEmpty {
            operand = value
        } else {
            firstNumber = currentNumber.floatValue
            operand = value
            currentNumber = .empty
        }
    }
    
    private func appendNumber(_ value: CalculatorButton) {
        currentNumber += value.title
        display = formattedNumber
    }
    
    private func addDecimalPoint() {
        if !currentNumber.contains(".") {
            if currentNumber.isEmpty {
                currentNumber = "0."
            } else {
                currentNumber += "."
            }
            display = formattedNumber
        }
    }
    
    private func invertSign() {
        if let num = Float(currentNumber), num != .zero {
            currentNumber = String(-num)
            display = formattedNumber
        }
    }
    
    private func calculatePercentage() {
        if let num = Float(currentNumber) {
            currentNumber = String(num / 100)
            display = currentNumber
        }
    }
    
    private func calculateResult() {
        if currentNumber.isEmpty {
            return
        }
        secondNumber = currentNumber.floatValue
        
        switch operand {
        case .plus:
            result = firstNumber + secondNumber
        case .minus:
            result = firstNumber - secondNumber
        case .multiply:
            result = firstNumber * secondNumber
        case .divider:
            result = firstNumber / secondNumber
        default:
            return
        }
        
        currentNumber = String(result)
        display = formattedNumber
    }
    
    
    private var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 6
        return formatter
    }()
    
    private var formattedNumber: String {
        if let number = Float(currentNumber) {
            return numberFormatter.string(from: NSNumber(value: number)) ?? currentNumber
        }
        return currentNumber
    }
    
}
