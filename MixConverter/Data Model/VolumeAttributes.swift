//
//  VolumeAttributes.swift
//  MixConverter
//
//  Created by CHENGJUN LU on 9/28/18.
//  Copyright © 2018 CHENGJUN LU. All rights reserved.
//

import UIKit

class VolumeAttributes {
    
      let VOLUME_UNITS_ARRAY = ["Milliliter", "Liter", "Cubic meter", "Cubic inch", "Cubic foot", "US liquid ounce", "US cup", "US liquid pint", "US liquid quart", "US liquid gallon"]
    
      let VOLUME_UNITS_SHORT_ARRAY = ["ml", "l", "m^3", "in^3", "ft^3", "ounce(US)", "cup(US)", "pint(US)", "quart(US)", "gallon(US)"]
    
      let MILLII_LITER = [1, 0.001, 0.000001, pow((1/2.54),3), pow(Double(1/2.54/12),3.0), 0.033814, 0.00422675, 0.00211338, 0.00105669, 0.000264172] as [Double]
    
    static let instance = VolumeAttributes()
    
    
}
