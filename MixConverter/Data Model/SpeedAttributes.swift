//
//  SpeedAttributes.swift
//  MixConverter
//
//  Created by CHENGJUN LU on 9/29/18.
//  Copyright © 2018 CHENGJUN LU. All rights reserved.
//

import UIKit

/**
 This class hold all Speed Unit related attributes
 */
class SpeedAttributes{
    
    /// Names of all speed units
    let SPEED_UNITS_ARRAY = ["Meter per second", "Kilometer per hour", "Foot per second,", "Miles per hour", "Knot"]
    
    /// Abbreviation of speed time units
    let SPEED_UNITS_SHORT_ARRAY = ["m/s", "km/hr", "ft/s", "mile/hr", "Knot"]
    
    /// Meter per second ratio to all speed unit in the order which list in SPEED_UNITS_ARRAY
    let METER_PER_SECOND_RATIO = [1, 3.6, 1/0.0254/12, 3600/(1/(1/0.0254/12/3/1760)), 1/(1.852*(1/3.6))] as [Double]
    
    /// Kilometer per hour ratio to all speed unit in the order which list in SPEED_UNITS_ARRAY
    let KILO_METER_PER_HOUR_RATIO = [1/3.6, 1, 1/3.6*(1/0.0254/12), 1/0.0000254/12/3/1760, 1/(1.852)] as [Double]
    
    /// Foot per second ratio to all speed unit in the order which list in SPEED_UNITS_ARRAY
    let FOOT_PER_SECOND_RATIO = [0.0254 * 12, 1/(1/3.6*(1/0.0254/12)), 1, 3600/5280, 1/(1.852 * 1/3.6*(1/0.0254/12))] as [Double]
    
    /// Miles per hour ratio to all speed unit in the order which list in SPEED_UNITS_ARRAY
    let MILE_PER_HOUR_RATIO = [1/(3600/(1/(1/0.0254/12/3/1760))), 1/(1/0.0000254/12/3/1760), 1/(3600/5280), 1, 1/(1.852 * 1/0.0000254/12/3/1760)] as [Double]
    
    /// Knot per second ratio to all speed unit in the order which list in SPEED_UNITS_ARRAY
    let KNOT_RATIO = [1.852*(1/3.6),1.852,1.852 * 1/3.6*(1/0.0254/12), 1.852 * 1/0.0000254/12/3/1760, 1 ] as [Double]
    
    /// Singleton - instance of SpeedAttributes()
    static let instance = SpeedAttributes()
    
}
