//
//  MassAttributes.swift
//  MixConverter
//
//  Created by CHENGJUN LU on 9/28/18.
//  Copyright © 2018 CHENGJUN LU. All rights reserved.
//

import UIKit

class MassAttributes {
    
    let MASS_UNITS_ARRAY = ["Nanogram","Microgram", "Milligram", "Gram", "Kilogram", "Metric Ton", "Ounce", "Pound", "Stone", "US ton", "Imperial ton"]
    
    let MASS_UNITS_SHORT_ARRAY = ["ng", "μg", "mg", "g", "kg", "Metric Ton", "oz", "lb", "Stone", "US ton", "Imperial ton"]
    
    let NANO_GRAM_RATIO = [1, 0.001, 0.000001, 0.000000001, 0.000000000001, 0.000000000000001,  1/28349500000, 1/28349500000/16, 1/28349500000/16/14, 1/28349500000/16/14/(2000/14), 1/28349500000/16/14/160 ] as [Double]
    
    let MICRO_GRAM_RATIO = [1000, 1, 0.001, 0.000001, 0.000000001, 0.000000000001, 1/28349500, 1/28349500/16, 1/28349500/16/14, 1/28349500/16/14/(2000/14), 1/28349500/16/14/160] as [Double]
    
    let MILLI_GRAM_RATIO = [1000000, 1000, 1, 0.001, 0.000001, 0.000000001,  1/28349.5, 1/28349.5/16, 1/28349.5/16/14, 1/28349.5/16/14/(2000/14), 1/28349.5/16/14/160] as [Double]
    
    let GRAM_RATIO = [1000000000, 1000000, 1000, 1, 0.001, 0.000001, 1/28.3495, 1/28.3495/16, 1/28.3495/16/14, 1/28.3495/16/14/(2000/14), 1/28.3495/16/14/160] as [Double]
    
    let KILO_GRAM_RATIO = [1000000000000, 1000000000, 1000000, 1000, 1, 0.001, 1/0.0283495, 1/0.0283495/16, 1/0.0283495/16/14, 1/0.0283495/16/14/(2000/14), 1/0.0283495/16/14/160] as [Double]
    
    let METRIC_TON_RATIO = [1000000000000000, 1000000000000, 1000000000, 1000000, 1000, 1, 1/0.0000283495, 1/0.0000283495/16, 1/0.0000283495/16/14,  1/0.0000283495/16/14/(2000/14),  1/0.0000283495/16/14/160] as [Double]
    
    static let instance = MassAttributes()
    
}
