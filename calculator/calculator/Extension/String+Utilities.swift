//
//  Extension+Utilities.swift
//  calculator
//
//  Created by Rodolfo on 27/08/23.
//

import Foundation


extension String {
    
    static var empty: String {
        return ""
    }
    
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}
