//
//  MassAttributes.swift
//  MixConverter
//
//  Created by CHENGJUN LU on 9/28/18.
//  Copyright © 2018 CHENGJUN LU. All rights reserved.
//

import UIKit

/**
 This class hold all Mass Unit related attributes
 */
class MassAttributes {
    
    /// Names of all mass units
    let MASS_UNITS_ARRAY = ["Nanogram","Microgram", "Milligram", "Gram", "Kilogram", "Metric Ton", "Ounce", "Pound", "Stone", "US ton", "Imperial ton"]
    
    /// Abbreviation of all mass units
    let MASS_UNITS_SHORT_ARRAY = ["ng", "μg", "mg", "g", "kg", "Metric Ton", "oz", "lb", "Stone", "US ton", "Imperial ton"]
    
    /// Nanogram ratio to all mass unit in the order which list in MASS_UNITS_ARRAY
    let NANO_GRAM_RATIO = [1, 0.001, 0.000001, 0.000000001, 0.000000000001, 0.000000000000001,  1/28349500000, 1/28349500000/16, 1/28349500000/16/14, 1/28349500000/16/14/(2000/14), 1/28349500000/16/14/160 ] as [Double]
    
    /// Microgram ratio to all mass unit in the order which list in MASS_UNITS_ARRAY
    let MICRO_GRAM_RATIO = [1000, 1, 0.001, 0.000001, 0.000000001, 0.000000000001, 1/28349500, 1/28349500/16, 1/28349500/16/14, 1/28349500/16/14/(2000/14), 1/28349500/16/14/160] as [Double]
    
    /// Milligram ratio to all mass unit in the order which list in MASS_UNITS_ARRAY
    let MILLI_GRAM_RATIO = [1000000, 1000, 1, 0.001, 0.000001, 0.000000001,  1/28349.5, 1/28349.5/16, 1/28349.5/16/14, 1/28349.5/16/14/(2000/14), 1/28349.5/16/14/160] as [Double]
    
    /// Gram ratio to all mass unit in the order which list in MASS_UNITS_ARRAY
    let GRAM_RATIO = [1000000000, 1000000, 1000, 1, 0.001, 0.000001, 1/28.3495, 1/28.3495/16, 1/28.3495/16/14, 1/28.3495/16/14/(2000/14), 1/28.3495/16/14/160] as [Double]
    
    /// Kilogram ratio to all mass unit in the order which list in MASS_UNITS_ARRAY
    let KILO_GRAM_RATIO = [1000000000000, 1000000000, 1000000, 1000, 1, 0.001, 1/0.0283495, 1/0.0283495/16, 1/0.0283495/16/14, 1/0.0283495/16/14/(2000/14), 1/0.0283495/16/14/160] as [Double]
    
    /// Metric Ton ratio to all mass unit in the order which list in MASS_UNITS_ARRAY
    let METRIC_TON_RATIO = [1000000000000000, 1000000000000, 1000000000, 1000000, 1000, 1, 1/0.0000283495, 1/0.0000283495/16, 1/0.0000283495/16/14,  1/0.0000283495/16/14/(2000/14),  1/0.0000283495/16/14/160] as [Double]
    
    /// Ounce ratio to all mass unit in the order which list in MASS_UNITS_ARRAY
    let OUNCE_RATIO = [28349500000, 28349500, 28349.5, 28.3495, 0.0283495, 0.0000283495, 1, 1/16, 1/16/14, 1/16/14/(2000/14), 1/16/14/160] as [Double]
    
    /// Pound ratio to all mass unit in the order which list in MASS_UNITS_ARRAY
    let POUND_RATIO = [28349500000 * 16, 28349500 * 16, 28349.5 * 16, 28.3495 * 16, 0.0283495 * 16, 0.0000283495 * 16, 16, 1, 1/14, 1/14/(2000/14), 1/14/160] as [Double]
    
    /// Stone ratio to all mass unit in the order which list in MASS_UNITS_ARRAY
    let STONE_RATIO = [28349500000 * 16 * 14, 28349500 * 16 * 14, 28349.5 * 16 * 14, 28.3495 * 16 * 14, 0.0283495 * 16 * 14, 0.0000283495 * 16 * 14, 16 * 14, 14, 1, 1/(2000/14), 1/160] as [Double]
    
    /// US ton ratio to all mass unit in the order which list in MASS_UNITS_ARRAY
    let US_TON_RATIO = [28349500000 * 16 * 14 * (2000/14), 28349500 * 16 * 14 * (2000/14), 28349.5 * 16 * 14 * (2000/14), 28.3495 * 16 * 14 * (2000/14), 0.0283495 * 16 * 14 * (2000/14), 0.0000283495 * 16 * 14 * (2000/14), 16 * 14 * (2000/14), 14 * (2000/14), (2000/14), 1, 1/1.12] as [Double]
    
    /// Imperial ton ratio to all mass unit in the order which list in MASS_UNITS_ARRAY
    let IMPERIAL_TON_RATIO = [28349500000 * 16 * 14 * 160, 28349500 * 16 * 14 * 160, 28349.5 * 16 * 14 * 160, 28.3495 * 16 * 14 * 160, 0.0283495 * 16 * 14 * 160, 0.0000283495 * 16 * 14 * 160, 16 * 14 * 160, 14 * 160, 160, 1.12, 1] as [Double]
    
    /// Singleton - instance of  MassAttributes()
    static let instance = MassAttributes()
    
}
