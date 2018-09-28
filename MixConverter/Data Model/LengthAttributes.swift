//
//  LengthAttributes.swift
//  MixConverter
//
//  Created by CHENGJUN LU on 9/28/18.
//  Copyright © 2018 CHENGJUN LU. All rights reserved.
//

import UIKit

class LengthAttributes {
    
    let LENGTH_UNITS_ARRAY = ["Nanometer", "MicroMeter", "Millimeter", "Centimeter", "Decimeter", "Meter", "Kilometer", "Inch", "Foot", "Yard","Mile"]
    
    let LENGTH_UNITS_SHORT_ARRAY = ["nm", "μm", "mm", "cm", "dm", "m", "km", "inch", "ft", "yard","mile"]
    
    let NANO_METER_RATIO = [1, 0.001, 0.000001, 0.0000001, 0.00000001 ,0.000000001, 0.000000000001, 1/25400000, 1/25400000/12, 1/25400000/12/3, 1/25400000/12/3/1760] as [Double]
    
    let MICRO_METER_RATIO = [1000, 1, 0.001, 0.0001, 0.00001,0.000001, 0.000000001, 1/25400, 1/25400/12, 1/25400/12/3, 1/25400/12/3/1760] as [Double]
    
    let MILLI_METER_RATIO = [1000000, 1000,1, 0.1, 0.01, 0.001,0.000001, 1/25.4, 1/25.4/12, 1/25.4/12/3, 1/25.4/12/3/1760] as [Double]
    
    let CENTI_METER_RATIO = [10000000, 10000,10, 1, 0.1, 0.01, 0.00001, 1/2.54, 1/2.54/12, 1/2.54/12/3, 1/2.54/12/3/1760] as [Double]
    
    let DECI_METER_RATIO = [100000000, 100000,100, 10, 1, 0.1, 0.0001, 1/0.254, 1/0.254/12, 1/0.254/12/3, 1/0.254/12/3/1760] as [Double]
    
    let METER_RATIO = [1000000000, 1000000,1000, 100, 10, 1, 0.001, 1/0.0254, 1/0.0254/12, 1/0.0254/12/3, 1/0.0254/12/3/1760] as [Double]
    
    let KILO_METER_RATIO = [1000000000000, 1000000000,1000000, 100000, 10000, 1000, 1, 1/0.0000254, 1/0.0000254/12, 1/0.0000254/12/3, 1/0.0000254/12/3/1760] as [Double]
    
    let INCH_RATIO = [25400000, 25400, 25.4, 2.54, 0.254, 0.0254, 0.0000254, 1, 1/12, 1/12 * (1/3), 1/12*(1/3)*(1/1760) ] as [Double]
    
    let FOOT_RATIO = [25400000 * 12, 25400 * 12, 25.4 * 12, 2.54 * 12, 0.254 * 12, 0.0254 * 12, 0.0000254 * 12, 12, 1, 1/3, (1/3)*(1/1760) ] as [Double]
    
    let YARD_RATIO = [25400000 * 12 * 3, 25400 * 12 * 3, 25.4 * 12 * 3, 2.54 * 12 * 3, 0.254 * 12 * 3, 0.0254 * 12 * 3, 0.0000254 * 12 * 3, 36, 3, 1, 1/1760 ] as [Double]
    
    let MILE_RATIO = [25400000 * 12 * 3 * 1760, 25400 * 12 * 3 * 1760, 25.4 * 12 * 3 * 1760, 2.54 * 12 * 3 * 1760, 0.254 * 12 * 3 * 1760, 0.0254 * 12 * 3 * 1760, 0.0000254 * 12 * 3 * 1760, 63360, 5280, 1760, 1 ] as [Double]
    
    static let instance = LengthAttributes()
    
}
