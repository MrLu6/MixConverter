//
//  Attributes.swift
//  MixConverter
//
//  Created by CHENGJUN LU on 9/24/18.
//  Copyright © 2018 CHENGJUN LU. All rights reserved.
//

import UIKit

class Attributes {
    
    let EXPONENTSYMBOL = "e"
    
    let DECIMAL_POINT = "."
    
    let DECIMAL_PLACE_ARRAY = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
  
    let DECIMAL_PLACE_FORMAT_ARRAY = ["%.0f", "%.1f", "%.2f", "%.3f", "%.4f", "%.5f", "%.6f", "%.7f", "%.8f", "%.9f"]
    
    var LENGTH_COVERTER_IS_ON = false
    
    var MASS_CONVERTER_IS_ON = false
    
    var VOLUME_CONVERTER_IS_ON = false
    
    var TEMPERATRUE_CONVERTER_IS_ON = false
    
    var TIME_CONVERTER_IS_ON = false
    
    var SPEED_CONVERTER_IS_ON = false
    
    let USER_INPUT_WARNING = "Your Input Is Not A Number"
    
    static let instance = Attributes()
    
    func enableLengthConverter() {
    
        Attributes.instance.LENGTH_COVERTER_IS_ON = true
        Attributes.instance.MASS_CONVERTER_IS_ON = false
        Attributes.instance.VOLUME_CONVERTER_IS_ON = false
        Attributes.instance.TEMPERATRUE_CONVERTER_IS_ON = false
        Attributes.instance.TIME_CONVERTER_IS_ON = false
        Attributes.instance.SPEED_CONVERTER_IS_ON = false
        
    }
    
    func enableMassConverter() {
        
        Attributes.instance.LENGTH_COVERTER_IS_ON = false
        Attributes.instance.MASS_CONVERTER_IS_ON = true
        Attributes.instance.VOLUME_CONVERTER_IS_ON = false
        Attributes.instance.TEMPERATRUE_CONVERTER_IS_ON = false
        Attributes.instance.TIME_CONVERTER_IS_ON = false
        Attributes.instance.SPEED_CONVERTER_IS_ON = false
        
    }
    
    func enableVolumeConverter() {
        
        Attributes.instance.LENGTH_COVERTER_IS_ON = false
        Attributes.instance.MASS_CONVERTER_IS_ON = false
        Attributes.instance.VOLUME_CONVERTER_IS_ON = true
        Attributes.instance.TEMPERATRUE_CONVERTER_IS_ON = false
        Attributes.instance.TIME_CONVERTER_IS_ON = false
        Attributes.instance.SPEED_CONVERTER_IS_ON = false
        
    }
    
    func enableTemperatureConverter() {
        
        Attributes.instance.LENGTH_COVERTER_IS_ON = false
        Attributes.instance.MASS_CONVERTER_IS_ON = false
        Attributes.instance.VOLUME_CONVERTER_IS_ON = false
        Attributes.instance.TEMPERATRUE_CONVERTER_IS_ON = true
        Attributes.instance.TIME_CONVERTER_IS_ON = false
        Attributes.instance.SPEED_CONVERTER_IS_ON = false
        
    }
    
    func enableTimeConverter() {
        
        Attributes.instance.LENGTH_COVERTER_IS_ON = false
        Attributes.instance.MASS_CONVERTER_IS_ON = false
        Attributes.instance.VOLUME_CONVERTER_IS_ON = false
        Attributes.instance.TEMPERATRUE_CONVERTER_IS_ON = false
        Attributes.instance.TIME_CONVERTER_IS_ON = true
        Attributes.instance.SPEED_CONVERTER_IS_ON = false
        
    }
    
    func enableSpeedConverter() {
        
        Attributes.instance.LENGTH_COVERTER_IS_ON = false
        Attributes.instance.MASS_CONVERTER_IS_ON = false
        Attributes.instance.VOLUME_CONVERTER_IS_ON = false
        Attributes.instance.TEMPERATRUE_CONVERTER_IS_ON = false
        Attributes.instance.TIME_CONVERTER_IS_ON = false
        Attributes.instance.SPEED_CONVERTER_IS_ON = true
        
    }
    
    func disableAllConverter() {
        
        Attributes.instance.LENGTH_COVERTER_IS_ON = false
        Attributes.instance.MASS_CONVERTER_IS_ON = false
        Attributes.instance.VOLUME_CONVERTER_IS_ON = false
        Attributes.instance.TEMPERATRUE_CONVERTER_IS_ON = false
        Attributes.instance.TIME_CONVERTER_IS_ON = false
        Attributes.instance.SPEED_CONVERTER_IS_ON = true
        
    }

    
    
}


