//
//  Attributes.swift
//  MixConverter
//
//  Created by CHENGJUN LU on 9/24/18.
//  Copyright © 2018 CHENGJUN LU. All rights reserved.
//

import UIKit

/**
 This class hold all general attributes use in MixConvertViewController.swift
 HomeViewController.swift and MenuTableViewController.swift
 */
class Attributes {
    
    /// Number 2
    let TWO = 2
    
    ///rearViewRevealWidth
    let REAR_VIEW_REVEAL_WIDTH = CGFloat(150)
    
    /// Exponentsymbol of numbers
    let EXPONENTSYMBOL = "e"
    
    /// Decimal point
    let DECIMAL_POINT = "."
    
    /// Use to fill the title of row of decimalPlacePickerView in MixConvertViewController.swift
    let DECIMAL_PLACE_ARRAY = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
  
    /// Use to fill the string fomat for number of digits need to be rounded
    let DECIMAL_PLACE_FORMAT_ARRAY = ["%.0f", "%.1f", "%.2f", "%.3f", "%.4f", "%.5f", "%.6f", "%.7f", "%.8f", "%.9f"]
    
    /// Length converter enable indicator
    var LENGTH_COVERTER_IS_ON = false
    
    /// Mass converter enable indicator
    var MASS_CONVERTER_IS_ON = false
    
    /// Volume converter enable indicator
    var VOLUME_CONVERTER_IS_ON = false
    
    /// Temperature converter enable indicator
    var TEMPERATRUE_CONVERTER_IS_ON = false
    
    /// Time converter enable indicator
    var TIME_CONVERTER_IS_ON = false
    
    /// Speed converter enable indicator
    var SPEED_CONVERTER_IS_ON = false
    
    /// User warning message
    let USER_INPUT_WARNING = "Your Input Is Not A Number"
    
    /// Indicate Scientific Notation is Off in Text
    let SCIENTIFIC_IS_OFF_TEXT = "Scientific Notation OFF"
    
    /// Indicate Scientific Notation is on in Text
    let SCIENTIFIC_IS_ON_TEXT = "Scientific Notation ON"
    
    /// Singleton - instance of Attributes()
    static let instance = Attributes()
    
    /**
     This function will enable length converter by setting length converter enable indicator
     to true and rest of converter enable indicators to false
     
     */
    func enableLengthConverter() {
    
        Attributes.instance.LENGTH_COVERTER_IS_ON = true
        Attributes.instance.MASS_CONVERTER_IS_ON = false
        Attributes.instance.VOLUME_CONVERTER_IS_ON = false
        Attributes.instance.TEMPERATRUE_CONVERTER_IS_ON = false
        Attributes.instance.TIME_CONVERTER_IS_ON = false
        Attributes.instance.SPEED_CONVERTER_IS_ON = false
        
    }
    
    /**
     This function will enable mass converter by setting mass converter enable indicator
     to true and rest of converter enable indicators to false
     
     */
    func enableMassConverter() {
        
        Attributes.instance.LENGTH_COVERTER_IS_ON = false
        Attributes.instance.MASS_CONVERTER_IS_ON = true
        Attributes.instance.VOLUME_CONVERTER_IS_ON = false
        Attributes.instance.TEMPERATRUE_CONVERTER_IS_ON = false
        Attributes.instance.TIME_CONVERTER_IS_ON = false
        Attributes.instance.SPEED_CONVERTER_IS_ON = false
        
    }
    
    /**
     This function will enable volume converter by setting volume converter enable indicator
     to true and rest of converter enable indicators to false
     
     */
    func enableVolumeConverter() {
        
        Attributes.instance.LENGTH_COVERTER_IS_ON = false
        Attributes.instance.MASS_CONVERTER_IS_ON = false
        Attributes.instance.VOLUME_CONVERTER_IS_ON = true
        Attributes.instance.TEMPERATRUE_CONVERTER_IS_ON = false
        Attributes.instance.TIME_CONVERTER_IS_ON = false
        Attributes.instance.SPEED_CONVERTER_IS_ON = false
        
    }
    
    /**
     This function will enable temperature converter by setting tempearture converter enable indicator
     to true and rest of converter enable indicators to false
     
     */
    func enableTemperatureConverter() {
        
        Attributes.instance.LENGTH_COVERTER_IS_ON = false
        Attributes.instance.MASS_CONVERTER_IS_ON = false
        Attributes.instance.VOLUME_CONVERTER_IS_ON = false
        Attributes.instance.TEMPERATRUE_CONVERTER_IS_ON = true
        Attributes.instance.TIME_CONVERTER_IS_ON = false
        Attributes.instance.SPEED_CONVERTER_IS_ON = false
        
    }
    
    /**
     This function will enable time converter by setting time converter enable indicator
     to true and rest of converter enable indicators to false
     
     */
    func enableTimeConverter() {
        
        Attributes.instance.LENGTH_COVERTER_IS_ON = false
        Attributes.instance.MASS_CONVERTER_IS_ON = false
        Attributes.instance.VOLUME_CONVERTER_IS_ON = false
        Attributes.instance.TEMPERATRUE_CONVERTER_IS_ON = false
        Attributes.instance.TIME_CONVERTER_IS_ON = true
        Attributes.instance.SPEED_CONVERTER_IS_ON = false
        
    }
    
    /**
     This function will enable speed converter by setting speed converter enable indicator
     to true and rest of converter enable indicators to false
     
     */
    func enableSpeedConverter() {
        
        Attributes.instance.LENGTH_COVERTER_IS_ON = false
        Attributes.instance.MASS_CONVERTER_IS_ON = false
        Attributes.instance.VOLUME_CONVERTER_IS_ON = false
        Attributes.instance.TEMPERATRUE_CONVERTER_IS_ON = false
        Attributes.instance.TIME_CONVERTER_IS_ON = false
        Attributes.instance.SPEED_CONVERTER_IS_ON = true
        
    }
    
    /**
     This function will disenable all unit converter 
     
     */
    func disableAllConverter() {
        
        Attributes.instance.LENGTH_COVERTER_IS_ON = false
        Attributes.instance.MASS_CONVERTER_IS_ON = false
        Attributes.instance.VOLUME_CONVERTER_IS_ON = false
        Attributes.instance.TEMPERATRUE_CONVERTER_IS_ON = false
        Attributes.instance.TIME_CONVERTER_IS_ON = false
        Attributes.instance.SPEED_CONVERTER_IS_ON = true
        
    }

    
    
}


