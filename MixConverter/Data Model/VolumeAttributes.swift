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
    
    let MILLI_LITER_RATIO = [1, 0.001, 0.000001, pow((1/2.54),3), pow(Double(1/2.54/12),3.0), 0.03381402270184299520, 0.0042267528377303744, 0.002113376418865187328, 0.001056688209432593664, 0.000264172052358148416] as [Double]
    
    let LITER_RATIO = [1000, 1, 0.001, pow((1/2.54),3) * 1000, pow(Double(1/2.54/12),3.0) * 1000, 33.81402270184299520, 4.2267528377303744, 2.113376418865187328, 1.056688209432593664, 0.264172052358148416] as [Double]
    
    let CUBIC_METER_RATIO = [1000000, 1000, 1, pow((1/2.54),3) * 1000000, pow(Double(1/2.54/12),3.0) * 1000000, 33814.02270184299520, 4226.7528377303744, 2113.376418865187328, 1056.688209432593664, 264.172052358148416] as [Double]
    
    let CUBIC_INCH_RATIO = [1/(pow((1/2.54),3)), 1/(pow((1/2.54),3))*0.001, 1/(pow((1/2.54),3))*0.000001, 1, 1/1728, 0.55411255411255410688, 0.06926406926406926336, 0.03463203463203463168, 0.01731601731601731584, 0.00432900432900432896] as [Double]
    
    let CUBIC_FOOT_RATIO = [1/pow(Double(1/2.54/12),3.0), 1/pow(Double(1/2.54/12),3.0) * 0.001,1/pow(Double(1/2.54/12),3.0) * 0.000001, 1728, 1, 957.506493506494, 119.688311688312, 59.844155844155840, 29.9220779220779200, 7.4805194805194800]
    
    let OUNCE_RATIO = [1/0.03381402270184299520, 1/33.81402270184299520, 1/33814.02270184299520, 1/0.55411255411255410688, 1/957.506493506494, 1, 1/8, 1/8/2, 1/8/2/2, 1/8/2/2/4] as [Double]
    
    static let instance = VolumeAttributes()
    
    
}
