//
//  ContentView.swift
//  calculator
//
//  Created by Rodolfo on 26/08/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var env: CalculatorViewModel
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 15) {
                
                HStack {
                    Spacer()
                    Text(env.display)
                        .foregroundColor(.white)
                        .font(.system(size: 64))
                    
                }.padding()
                
                ForEach(env.buttons, id: \.self) { row in
                    HStack{
                        ForEach(row, id: \.self) { button in
                            ButtonView(button: button)
                        }
                    }
                }
            }.padding(.bottom)
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(CalculatorViewModel())
    }
}
