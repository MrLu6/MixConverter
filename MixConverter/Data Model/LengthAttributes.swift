//
//  LengthAttributes.swift
//  MixConverter
//
//  Created by CHENGJUN LU on 9/28/18.
//  Copyright © 2018 CHENGJUN LU. All rights reserved.
//

import UIKit

/**
 This class hold all Length Unit related attributes
 */
class LengthAttributes {
    
    /// Names of all length units
    let LENGTH_UNITS_ARRAY = ["Nanometer", "MicroMeter", "Millimeter", "Centimeter", "Decimeter", "Meter", "Kilometer", "Inch", "Foot", "Yard","Mile"]
    
    /// Abbreviation of all length units
    let LENGTH_UNITS_SHORT_ARRAY = ["nm", "μm", "mm", "cm", "dm", "m", "km", "inch", "ft", "yard","mile"]
    
    /// Nanometer ratio to all length unit in the order which list in LENGTH_UNITS_ARRAY
    let NANO_METER_RATIO = [1, 0.001, 0.000001, 0.0000001, 0.00000001 ,0.000000001, 0.000000000001, 1/25400000, 1/25400000/12, 1/25400000/12/3, 1/25400000/12/3/1760] as [Double]
    
    /// Micrometer ratio to all length unit in the order which list in LENGTH_UNITS_ARRAY
    let MICRO_METER_RATIO = [1000, 1, 0.001, 0.0001, 0.00001,0.000001, 0.000000001, 1/25400, 1/25400/12, 1/25400/12/3, 1/25400/12/3/1760] as [Double]
    
    /// Millimeter ratio to all length unit in the order which list in LENGTH_UNITS_ARRAY
    let MILLI_METER_RATIO = [1000000, 1000,1, 0.1, 0.01, 0.001,0.000001, 1/25.4, 1/25.4/12, 1/25.4/12/3, 1/25.4/12/3/1760] as [Double]
    
    /// Centimeter ratio to all length unit in the order which list in LENGTH_UNITS_ARRAY
    let CENTI_METER_RATIO = [10000000, 10000,10, 1, 0.1, 0.01, 0.00001, 1/2.54, 1/2.54/12, 1/2.54/12/3, 1/2.54/12/3/1760] as [Double]
    
    /// Decimeter ratio to all length unit in the order which list in LENGTH_UNITS_ARRAY
    let DECI_METER_RATIO = [100000000, 100000,100, 10, 1, 0.1, 0.0001, 1/0.254, 1/0.254/12, 1/0.254/12/3, 1/0.254/12/3/1760] as [Double]
    
    /// Meter ratio to all length unit in the order which list in LENGTH_UNITS_ARRAY
    let METER_RATIO = [1000000000, 1000000,1000, 100, 10, 1, 0.001, 1/0.0254, 1/0.0254/12, 1/0.0254/12/3, 1/0.0254/12/3/1760] as [Double]
    
    /// Kilometer ratio to all length unit in the order which list in LENGTH_UNITS_ARRAY
    let KILO_METER_RATIO = [1000000000000, 1000000000,1000000, 100000, 10000, 1000, 1, 1/0.0000254, 1/0.0000254/12, 1/0.0000254/12/3, 1/0.0000254/12/3/1760] as [Double]
    
    /// Inchmeter ratio to all length unit in the order which list in LENGTH_UNITS_ARRAY
    let INCH_RATIO = [25400000, 25400, 25.4, 2.54, 0.254, 0.0254, 0.0000254, 1, 1/12, 1/12 * (1/3), 1/12*(1/3)*(1/1760) ] as [Double]
    
    /// Foot ratio to all length unit in the order which list in LENGTH_UNITS_ARRAY
    let FOOT_RATIO = [25400000 * 12, 25400 * 12, 25.4 * 12, 2.54 * 12, 0.254 * 12, 0.0254 * 12, 0.0000254 * 12, 12, 1, 1/3, (1/3)*(1/1760) ] as [Double]
    
    /// Yard ratio to all length unit in the order which list in LENGTH_UNITS_ARRAY
    let YARD_RATIO = [25400000 * 12 * 3, 25400 * 12 * 3, 25.4 * 12 * 3, 2.54 * 12 * 3, 0.254 * 12 * 3, 0.0254 * 12 * 3, 0.0000254 * 12 * 3, 36, 3, 1, 1/1760 ] as [Double]
    
    /// Mile ratio to all length unit in the order which list in LENGTH_UNITS_ARRAY
    let MILE_RATIO = [25400000 * 12 * 3 * 1760, 25400 * 12 * 3 * 1760, 25.4 * 12 * 3 * 1760, 2.54 * 12 * 3 * 1760, 0.254 * 12 * 3 * 1760, 0.0254 * 12 * 3 * 1760, 0.0000254 * 12 * 3 * 1760, 63360, 5280, 1760, 1 ] as [Double]
    
    /// Singleton - instance of  LengthAttributes()
    static let instance = LengthAttributes()
    
}
