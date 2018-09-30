//
//  TemperatureAttributes.swift
//  MixConverter
//
//  Created by CHENGJUN LU on 9/28/18.
//  Copyright © 2018 CHENGJUN LU. All rights reserved.
//

import UIKit

/**
 This class hold all Temperature Unit related attributes
 */
class TemperatureAttributes{
    
    /// Names of all temperature units
    let TEMPERATURE_UNITS_ARRAY = ["Celsius", "Fahrenheit", "Kelvin"]
    
    /// Abbreviation of all temperature units
    let TEMPERATURE_UNITS_SHORT_ARRAY = ["°C", "°F", "K"]
    
    /// Singleton - instance of TemperatureAttributes()
    static let instance = TemperatureAttributes()
}
