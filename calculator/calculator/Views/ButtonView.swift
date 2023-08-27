//
//  ButtonView.swift
//  calculator
//
//  Created by Rodolfo on 26/08/23.
//

import Foundation
import SwiftUI

struct ButtonView: View {
    
    var button: CalculatorButton
    @EnvironmentObject var env: CalculatorViewModel
    
    var body: some View {
        Button(action: {
            env.receiveInput(value: button)
        }) {
            Text(button.title)
                .font(.system(size: 32))
                .frame(width: buttonWidt(button), height: buttonHeight())
                .foregroundColor(.white)
                .background(button.background)
                .cornerRadius(buttonWidt(button))
        }
    }
    
    private func buttonWidt(_ button: CalculatorButton) -> CGFloat {
        return button == .zero ? (UIScreen.main.bounds.width - 4 * 12) / 4 * 2 : (UIScreen.main.bounds.width - 5 * 12) / 4
    }
    
    private func buttonHeight() -> CGFloat {
        return  (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}


struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(button: CalculatorButton.zero)
    }
}
