//
//  SwiftUIViewteste.swift
//  calculator
//
//  Created by Rodolfo on 28/08/23.
//

import SwiftUI

struct SwiftUIViewteste: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("ola merda")
                    
                    .refreshable {
                        
                    }
            }
        }
    }
}

struct SwiftUIViewteste_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewteste()
    }
}
