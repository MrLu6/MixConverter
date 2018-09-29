//
//  Attributes.swift
//  MixConverter
//
//  Created by CHENGJUN LU on 9/24/18.
//  Copyright © 2018 CHENGJUN LU. All rights reserved.
//

import UIKit

class Attributes {
    
//    let DEFAULT_INPUT = "0"
//
//    let DEFAULT_DECIMAL_PLACE = 2
//
//    let DEFAULT_SCIENTIFIC_NOTATION_IS_ON = false
    
    let EXPONENTSYMBOL = "e"
    
    let DECIMAL_POINT = "."
    
    let DECIMAL_PLACE_ARRAY = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
  
    let DECIMAL_PLACE_FORMAT_ARRAY = ["%.0f", "%.1f", "%.2f", "%.3f", "%.4f", "%.5f", "%.6f", "%.7f", "%.8f", "%.9f"]
    
    var LENGTH_COVERT_IS_ON = false
    
    var MASS_CONVERT_IS_ON = false
    
    var VOLUME_CONVERT_IS_ON = false
    
    let USER_INPUT_WARNING = "Your Input Is Not A Number"

    static let instance = Attributes()
    
}


