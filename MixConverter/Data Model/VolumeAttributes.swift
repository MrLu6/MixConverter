//
//  VolumeAttributes.swift
//  MixConverter
//
//  Created by CHENGJUN LU on 9/28/18.
//  Copyright © 2018 CHENGJUN LU. All rights reserved.
//

import UIKit

/**
 This class hold all Volume Unit related attributes
 */
class VolumeAttributes {
    
    /// Names of all volume units
    let VOLUME_UNITS_ARRAY = ["Milliliter", "Liter", "Cubic meter", "Cubic inch", "Cubic foot", "US fluid ounce", "US cup", "US liquid pint", "US liquid quart", "US liquid gallon"]
    
    /// Abbreviation of all volume units
    let VOLUME_UNITS_SHORT_ARRAY = ["mL", "L", "m^3", "in^3", "ft^3", "oz(US)", "cup(US)", "pint(US)", "quart(US)", "gallon(US)"]
    
    /// Milliliter ratio to all volume unit in the order which list in VOLUME_UNITS_ARRAY
    let MILLI_LITER_RATIO = [1, 0.001, 0.000001, pow((1/2.54),3), pow(Double(1/2.54/12),3.0), 0.03381402270184299520, 0.0042267528377303744, 0.002113376418865187328, 0.001056688209432593664, 0.000264172052358148416] as [Double]
    
    /// Liter ratio to all volume unit in the order which list in VOLUME_UNITS_ARRAY
    let LITER_RATIO = [1000, 1, 0.001, pow((1/2.54),3) * 1000, pow(Double(1/2.54/12),3.0) * 1000, 33.81402270184299520, 4.2267528377303744, 2.113376418865187328, 1.056688209432593664, 0.264172052358148416] as [Double]
    
    /// Cubic meter ratio to all volume unit in the order which list in VOLUME_UNITS_ARRAY
    let CUBIC_METER_RATIO = [1000000, 1000, 1, pow((1/2.54),3) * 1000000, pow(Double(1/2.54/12),3.0) * 1000000, 33814.02270184299520, 4226.7528377303744, 2113.376418865187328, 1056.688209432593664, 264.172052358148416] as [Double]
    
    /// Cubic inch ratio to all volume unit in the order which list in VOLUME_UNITS_ARRAY
    let CUBIC_INCH_RATIO = [1/(pow((1/2.54),3)), 1/(pow((1/2.54),3))*0.001, 1/(pow((1/2.54),3))*0.000001, 1, 1/1728, 0.55411255411255410688, 0.06926406926406926336, 0.03463203463203463168, 0.01731601731601731584, 0.00432900432900432896] as [Double]
    
    /// Cubic foot ratio to all volume unit in the order which list in VOLUME_UNITS_ARRAY
    let CUBIC_FOOT_RATIO = [1/pow(Double(1/2.54/12),3.0), 1/pow(Double(1/2.54/12),3.0) * 0.001,1/pow(Double(1/2.54/12),3.0) * 0.000001, 1728, 1, 957.506493506494, 119.688311688312, 59.844155844155840, 29.9220779220779200, 7.4805194805194800]
    
    /// US fluid ounce to all volume unit in the order which list in VOLUME_UNITS_ARRAY
    let US_FLUID_OUNCE_RATIO = [1/0.03381402270184299520, 1/33.81402270184299520, 1/33814.02270184299520, 1/0.55411255411255410688, 1/957.506493506494, 1, 1/8, 1/8/2, 1/8/2/2, 1/8/2/2/4] as [Double]
    
    /// US cup ratio to all volume unit in the order which list in VOLUME_UNITS_ARRAY
    let US_CUP_RATIO = [1/0.0042267528377303744, 1/4.2267528377303744, 1/4226.7528377303744, 1/0.06926406926406926336, 1/119.688311688312, 8, 1, 1/2, 1/2/2, 1/2/2/4] as[Double]
    
    /// US liquid pint ratio to all volume unit in the order which list in VOLUME_UNITS_ARRAY
    let US_LIQUID_PINT = [1/0.002113376418865187328, 1/2.113376418865187328, 1/2113.376418865187328, 1/0.03463203463203463168, 1/59.844155844155840, 8*2, 2, 1, 1/2, 1/2/4 ] as [Double]
    
    /// US liquid quart ratio to all volume unit in the order which list in VOLUME_UNITS_ARRAY
    let US_LIQUID_QUART = [1/0.001056688209432593664, 1/1.056688209432593664, 1/1056.688209432593664, 1/0.01731601731601731584, 1/29.9220779220779200, 8*2*2,2*2, 2, 1, 1/4 ] as [Double]
    
    /// US liquid gallon ratio to all volume unit in the order which list in VOLUME_UNITS_ARRAY
    let US_LIQUID_GALLON = [1/0.000264172052358148416, 1/0.264172052358148416, 1/264.172052358148416, 1/0.00432900432900432896, 1/7.4805194805194800, 8*2*2*4, 2*2*4, 2*4, 4, 1] as [Double]
    
    /// Singleton - instance of  VolumeAttributes()
    static let instance = VolumeAttributes()
    
    
}
