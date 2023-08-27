//
//  CalculatorViewModel.swift
//  calculator
//
//  Created by Rodolfo on 26/08/23.
//

import Foundation
import SwiftUI

enum CalculatorButton: String {
    case zero, one, two, three, four, five, six, seven, heigth, nine
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
        case .heigth: return "8"
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
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .heigth, .nine, .dot:
            return Color(.darkGray)
        case .ac, .plusMinus, .porcent:
            return Color(.lightGray)
        default:
            return .orange
            
        }
    }
}

class CalculatorViewModel: ObservableObject {
    @Published var display = "00"
    
    var buttons: [[CalculatorButton]] = [
        [.ac, .plusMinus, .porcent, .divider],
        [.seven, .heigth, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .dot, .equals]
    ]
    
    func receiveInput(value: CalculatorButton) {
        display = value.title
    }
}
