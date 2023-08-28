//
//  calculatorApp.swift
//  calculator
//
//  Created by Rodolfo on 26/08/23.
//

import SwiftUI

@main
struct calculatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(vm: CalculatorViewModel())
        }
    }
}
