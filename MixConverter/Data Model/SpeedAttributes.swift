//
//  SpeedAttributes.swift
//  MixConverter
//
//  Created by CHENGJUN LU on 9/29/18.
//  Copyright © 2018 CHENGJUN LU. All rights reserved.
//

import UIKit

class SpeedAttributes{
    
    let SPEED_UNITS_ARRAY = ["Meter per second", "Kilometer per hour", "Foot per second,", "Miles per hour", "Knot"]
    
    let SPEED_UNITS_SHORT_ARRAY = ["m/s", "km/hr", "ft/s", "mile/hr", "Knot"]
    
    let METER_PER_SECOND_RATIO = [1, 3.6, 1/0.0254/12, 3600/(1/(1/0.0254/12/3/1760)), 1/(1.852*(1/3.6))] as [Double]
    
    let KILO_METER_PER_HOUR_RATIO = [1/3.6, 1, 1/3.6*(1/0.0254/12), 1/0.0000254/12/3/1760, 1/(1.852)] as [Double]
    
    let FOOT_PER_SECOND_RATIO = [0.0254 * 12, 1/(1/3.6*(1/0.0254/12)), 1, 3600/5280, 1/(1.852 * 1/3.6*(1/0.0254/12))] as [Double]
    
    let MILE_PER_HOUR_RATIO = [1/(3600/(1/(1/0.0254/12/3/1760))), 1/(1/0.0000254/12/3/1760), 1/(3600/5280), 1, 1/(1.852 * 1/0.0000254/12/3/1760)] as [Double]
    
    let KNOT_RATIO = [1.852*(1/3.6),1.852,1.852 * 1/3.6*(1/0.0254/12), 1.852 * 1/0.0000254/12/3/1760, 1 ] as [Double]
    
    static let instance = SpeedAttributes()
    
}
