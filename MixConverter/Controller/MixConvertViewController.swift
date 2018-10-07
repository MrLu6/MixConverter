//
//  ViewController.swift
//  MixConverter
//
//  Created by CHENGJUN LU on 9/24/18.
//  Copyright © 2018 CHENGJUN LU. All rights reserved.
//

import UIKit

/**
    This class handles all user interactions of MixConvertViewController.
    Display the conversion result of corresponding type of unit converter based on user selection.
 */
class MixConvertViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {
    
    /// Use to hold conversion result base on user input and unit convert type with default value 0.00 in Double
    var convertResult = 0.00
    
    /// Use to hold conversion result base on user input and unit convert type in with default value 0.00 in String
    var convertResultString = String(0.00)
    
    /// Index of inputPicker with default value 0
    var inputPickerIndex = 0
    
    /// Index of outputPicker with default value 0
    var outputPickerIndex = 0
    
    /// Index of decimalPlacePicker with default value 2
    var decimalPlaceIndex = 2
    
    /// Scientific Notation Model Indicator
    var isScientific = false
    
    /// Button which go back to the slide menu
    @IBOutlet weak var MenuButton: UIBarButtonItem!
    
    /// User input TextField
    @IBOutlet weak var userInput: UITextField!
    
    /**
        This function calls displayConversionResult() to display the corresponding conversion result
        as user input change.
     */
    @IBAction func userInputChanged(_ sender: UITextField) {
        
       displayConversionResult()
        
    }
    
    /// Conversion Result TextField
    @IBOutlet weak var displayResult: UITextField!
    
    /// Use to display input type unit abbreviation
    @IBOutlet weak var inputUnitLabel: UILabel!
    
    /// Use to display output type unit abbreviation
    @IBOutlet weak var outputUnitLabel: UILabel!
    
    /// Display for user the current state off scientific Model
    @IBOutlet weak var scientificNotationIndication: UILabel!
    
    /// Use to hold user input unit type
    @IBOutlet weak var inputPicker: UIPickerView!
    
    /// Use to hold unit type which user want to convert
    @IBOutlet weak var outputPicker: UIPickerView!
    
    /// Use to hold the number of digit user want to round
    @IBOutlet weak var decimalPlacePicker: UIPickerView!
    
    /// Switch on and off scientfic notation model
    @IBOutlet weak var scientificNotationSwitchBtn: UISwitch!
    
    /**
     This function react to scientificNotationSwitchBtn base on user selection,
     change isScientific value base on the current state of switch button.
     
     ## Import Notes ##
     1. Calling resignFirstResponder inside to dismiss number pad as user click
        on the switch button.
     2. Calling displayConversionResult() to display the convert value.
     
     - See Also: displayConversionResult().
     
    */
    @IBAction func scientificNotationSwitch(_ sender: UISwitch) {
        
        if sender.isOn {
            
            isScientific = true
            scientificNotationIndication.text = Attributes.instance.SCIENTIFIC_IS_ON_TEXT
            
        }else{
            
            isScientific = false
            scientificNotationIndication.text = Attributes.instance.SCIENTIFIC_IS_OFF_TEXT
            
        }
        
        userInput.resignFirstResponder()
        displayConversionResult()
        
    }
    
    /**
     This function helps set up the default value when view is loaded.
     
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputPicker.delegate = self
        inputPicker.dataSource = self
        
        outputPicker.delegate = self
        outputPicker.dataSource = self
        
        decimalPlacePicker.delegate = self
        decimalPlacePicker.dataSource = self
        
        displayResult.isEnabled = false
        decimalPlacePicker.selectRow(decimalPlaceIndex, inComponent: 0, animated: true)
        
        displayDefaultUnits()
        
        backToMenu()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    /**
     This function helps dismiss number pad when user tap outside form UITextField.
     
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for txt in self.view.subviews {
            if txt.isKind(of: UITextField.self) && txt.isFirstResponder {
                txt.resignFirstResponder()
            }
        }
        
    }
    
    /**
     This function handles the display of default unit type for both input and output
     depends on the converter that selected by user.
     
     */
    func displayDefaultUnits() {
        
        if Attributes.instance.LENGTH_COVERTER_IS_ON {
            
            inputUnitLabel.text = LengthAttributes.instance.LENGTH_UNITS_SHORT_ARRAY.first
            outputUnitLabel.text = LengthAttributes.instance.LENGTH_UNITS_SHORT_ARRAY.first
            
        }else if Attributes.instance.MASS_CONVERTER_IS_ON {
            
            inputUnitLabel.text = MassAttributes.instance.MASS_UNITS_SHORT_ARRAY.first
            outputUnitLabel.text = MassAttributes.instance.MASS_UNITS_SHORT_ARRAY.first
            
        }else if Attributes.instance.VOLUME_CONVERTER_IS_ON {
            
            inputUnitLabel.text = VolumeAttributes.instance.VOLUME_UNITS_SHORT_ARRAY.first
            outputUnitLabel.text = VolumeAttributes.instance.VOLUME_UNITS_SHORT_ARRAY.first
            
        }else if Attributes.instance.TEMPERATRUE_CONVERTER_IS_ON {
            
            inputUnitLabel.text = TemperatureAttributes.instance.TEMPERATURE_UNITS_SHORT_ARRAY.first
            outputUnitLabel.text = TemperatureAttributes.instance.TEMPERATURE_UNITS_SHORT_ARRAY.first
            
        }else if Attributes.instance.TIME_CONVERTER_IS_ON {
            
            inputUnitLabel.text = TimeAttributes.instance.TIME_UNITS_SHORT_ARRAY.first
            outputUnitLabel.text = TimeAttributes.instance.TIME_UNITS_SHORT_ARRAY.first
            
        }else if Attributes.instance.SPEED_CONVERTER_IS_ON {
            
            inputUnitLabel.text = SpeedAttributes.instance.SPEED_UNITS_SHORT_ARRAY.first
            outputUnitLabel.text = SpeedAttributes.instance.SPEED_UNITS_SHORT_ARRAY.first
            
        }
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    /**
     - SeeAlso: numRowOfSelectType().
     
    */
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 3 {
            
            return Attributes.instance.DECIMAL_PLACE_ARRAY.count
            
        }else {
           
            return numRowOfSelectType()
           
        }
    }
    
    /**
     This function will return the number of rows for the component base on the convert
     unit type whcih user selected.
     
     - Returns: The number of rows for the component.
     
    */
    func numRowOfSelectType() ->Int {
        
        if Attributes.instance.LENGTH_COVERTER_IS_ON {
            
            return LengthAttributes.instance.LENGTH_UNITS_ARRAY.count
            
        } else if Attributes.instance.MASS_CONVERTER_IS_ON {
            
            return MassAttributes.instance.MASS_UNITS_ARRAY.count
            
        } else if Attributes.instance.VOLUME_CONVERTER_IS_ON {
            
            return VolumeAttributes.instance.VOLUME_UNITS_ARRAY.count
            
        } else if Attributes.instance.TEMPERATRUE_CONVERTER_IS_ON {
            
            return TemperatureAttributes.instance.TEMPERATURE_UNITS_ARRAY.count
            
        } else if Attributes.instance.TIME_CONVERTER_IS_ON {
            
            return TimeAttributes.instance.TIME_UNITS_ARRAY.count
            
        } else if Attributes.instance.SPEED_CONVERTER_IS_ON {
            
            return SpeedAttributes.instance.SPEED_UNITS_ARRAY.count
            
        }
        
        return 0
        
    }
    
    /**
     - SeeAlso: displaySelectTypeUnits(row: Int).
 
    */
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 3 {
            
            return Attributes.instance.DECIMAL_PLACE_ARRAY[row]
            
        }
        else {
            
            return displaySelectTypeUnits(row: row)
            
        }
    }
    
    /**
     This function will return the titile for row  base on the convert
     unit type whcih user selected.
     
     */
    func displaySelectTypeUnits(row: Int) -> String? {
        
        if Attributes.instance.LENGTH_COVERTER_IS_ON {
            
            return LengthAttributes.instance.LENGTH_UNITS_ARRAY[row]
            
        } else if Attributes.instance.MASS_CONVERTER_IS_ON{
            
            return MassAttributes.instance.MASS_UNITS_ARRAY[row]
            
        } else if Attributes.instance.VOLUME_CONVERTER_IS_ON {
            
            return VolumeAttributes.instance.VOLUME_UNITS_ARRAY[row]
            
        } else if Attributes.instance.TEMPERATRUE_CONVERTER_IS_ON {
            
            return TemperatureAttributes.instance.TEMPERATURE_UNITS_ARRAY[row]
            
        } else if Attributes.instance.TIME_CONVERTER_IS_ON {
            
            return TimeAttributes.instance.TIME_UNITS_ARRAY[row]
            
        } else if Attributes.instance.SPEED_CONVERTER_IS_ON {
            
            return SpeedAttributes.instance.SPEED_UNITS_ARRAY[row]
            
        }
        
        return ""
        
    }
    
    /**
     
     ## Import Notes ##
     1. Calling displaySelectTypeShort() to display the current selected input and output
       unit type abbreviation.
     2. Calling displayConversionResult() to display the conversion result base on user selection
       of input and out put unit type
     3. Calling resignFirstResponder inside to dismiss number pad as user tap on the pickerView.
 
     - See Also: displaySelectTypeShort() and displayConversionResult()
     
     */
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        inputPickerIndex = inputPicker.selectedRow(inComponent: 0)
        outputPickerIndex = outputPicker.selectedRow(inComponent: 0)
        decimalPlaceIndex = decimalPlacePicker.selectedRow(inComponent: 0)
        
        displaySelectTypeShort()
        displayConversionResult()
        
        userInput.resignFirstResponder()

    }
    
    /**
     This function will display the corresponding unity type in short for
     both input and output unit. Also, it depends on which converter is on.
 
    */
    func displaySelectTypeShort() {
        
        if Attributes.instance.LENGTH_COVERTER_IS_ON {
            
            inputUnitLabel.text = LengthAttributes.instance.LENGTH_UNITS_SHORT_ARRAY[inputPickerIndex]
            outputUnitLabel.text = LengthAttributes.instance.LENGTH_UNITS_SHORT_ARRAY[outputPickerIndex]
            
        }else if Attributes.instance.MASS_CONVERTER_IS_ON {
            
            inputUnitLabel.text = MassAttributes.instance.MASS_UNITS_SHORT_ARRAY[inputPickerIndex]
            outputUnitLabel.text = MassAttributes.instance.MASS_UNITS_SHORT_ARRAY[outputPickerIndex]
            
        }else if Attributes.instance.VOLUME_CONVERTER_IS_ON {
            
            inputUnitLabel.text = VolumeAttributes.instance.VOLUME_UNITS_SHORT_ARRAY[inputPickerIndex]
            outputUnitLabel.text = VolumeAttributes.instance.VOLUME_UNITS_SHORT_ARRAY[outputPickerIndex]
            
        }else if Attributes.instance.TEMPERATRUE_CONVERTER_IS_ON {
            
            inputUnitLabel.text = TemperatureAttributes.instance.TEMPERATURE_UNITS_SHORT_ARRAY[inputPickerIndex]
            outputUnitLabel.text = TemperatureAttributes.instance.TEMPERATURE_UNITS_SHORT_ARRAY[outputPickerIndex]
            
        }else if Attributes.instance.TIME_CONVERTER_IS_ON {
            
            inputUnitLabel.text = TimeAttributes.instance.TIME_UNITS_SHORT_ARRAY[inputPickerIndex]
            outputUnitLabel.text = TimeAttributes.instance.TIME_UNITS_SHORT_ARRAY[outputPickerIndex]
            
        }else if Attributes.instance.SPEED_CONVERTER_IS_ON {
            
            inputUnitLabel.text = SpeedAttributes.instance.SPEED_UNITS_SHORT_ARRAY[inputPickerIndex]
            outputUnitLabel.text = SpeedAttributes.instance.SPEED_UNITS_SHORT_ARRAY[outputPickerIndex]
            
        }
        
    }
    
    /**
     This function will display the conversion result base on the unit type, decimal place
     and scientific notation which user selected.
     
     - See Also: calSelectTypeConversion()).
     */
    func displayConversionResult(){
        
        //User input validation(user input must be a valid number).
        if (!userInput.text!.isDouble() && !userInput.text!.isEmpty ){
            
            displayResult.text = Attributes.instance.USER_INPUT_WARNING
            
        } //Display the default conversion result(0.00).
        else if userInput.text!.isEmpty{
            
            //Show scientific notation if scientific model is enable.
            if isScientific{
                
                displayResult.text = Double(0).scientificStyle
                
            }else{
                
                displayResult.text = String(format:Attributes.instance.DECIMAL_PLACE_FORMAT_ARRAY[decimalPlaceIndex],0)
                
            }
            
        }else {
            
            calSelectTypeConversion()
            
            convertResultString = String(convertResult)
            
             //Show scientific notation if scientific model is enable.
            if isScientific {
                
                convertResultString = convertResult.scientificStyle
                
                displayResult.text = scientificModeConversion()

            }else{
                
                //Round the conversion result to number of digit to that user select in the decimalPlacePickerView.
                displayResult.text = String(format:Attributes.instance.DECIMAL_PLACE_FORMAT_ARRAY[decimalPlaceIndex],convertResult)
                
                convertResult = Double(displayResult.text!)!
            }

        }
        
    }
    
    
    /**
     This function call the correspoing unit type conversion calcaulte function based on
     enable converter check.
     
     - See Also: calLength(), calMass(), calVolume(), calTemperatrue(), calTime(), calSpeed().
     
     */
    func calSelectTypeConversion() {
        
        if Attributes.instance.LENGTH_COVERTER_IS_ON {
            calLength()
        }else if Attributes.instance.MASS_CONVERTER_IS_ON {
            calMass()
        }else if Attributes.instance.VOLUME_CONVERTER_IS_ON {
            calVolume()
        }else if Attributes.instance.TEMPERATRUE_CONVERTER_IS_ON {
            calTemperatrue()
        }else if Attributes.instance.TIME_CONVERTER_IS_ON {
            calTime()
        }else if Attributes.instance.SPEED_CONVERTER_IS_ON {
            calSpeed()
        }
        
    }
    
    /**
     This function will perform strig manipulation of conversion result.
     It will separate the power of number first, then round the number
     to the number of digt that user select in decimalPlacePickerView
     
    */
    func scientificModeConversion() -> String{
        
        // Get the index of exponentSymbol.
        if let eIndex = convertResultString.range(of: Attributes.instance.EXPONENTSYMBOL)?.lowerBound {
            
            let powerStartIndex = convertResultString.index(eIndex, offsetBy: 1)
            
            // Get the power of conversion result.
            let power = convertResultString[powerStartIndex..<convertResultString.endIndex]
            
            // Get the number before the  exponentSymbol of the conversion result.
            var convertResultUpToE = String(convertResultString[..<eIndex])
            
            // Add decimal point(.) the to number if it does not have one.
            if !convertResultUpToE.contains(Attributes.instance.DECIMAL_POINT){
                convertResultUpToE.append(Attributes.instance.DECIMAL_POINT)
            }
            
            // Add 0 to the end of the conversion result if it does not reach the number of digit which user want to round
            while convertResultUpToE.count < decimalPlaceIndex + Attributes.instance.TWO {
                convertResultUpToE.append("0")
            }
            
            // Round the conversion result to the number of digt that user select in decimalPlacePickerView.
            convertResultUpToE = String(format: Attributes.instance.DECIMAL_PLACE_FORMAT_ARRAY[decimalPlaceIndex], Double (convertResultUpToE)!)
            
           
            let converResultStringEndIndex = convertResultUpToE.index(convertResultString.startIndex, offsetBy: decimalPlaceIndex + Attributes.instance.TWO)
            
            let roundDecimal = convertResultUpToE[convertResultString.startIndex..<converResultStringEndIndex]
            
            // Return conversion result in scientific format.
            return String(roundDecimal + Attributes.instance.EXPONENTSYMBOL + power)
            
        }
        
        return convertResultString
        
    }
    
    /**
     This function will perform action that go to the slide menu whith gesture recognization.
     
     */
    func backToMenu(){
        
        MenuButton.target = self.revealViewController()
        MenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        self.revealViewController().rearViewRevealWidth = Attributes.instance.REAR_VIEW_REVEAL_WIDTH
        
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
    }

}

/**
    This extension of MixConvertViewController will hold all calculate methof of all unit type conversion.
 */
extension MixConvertViewController {
    
    /**
     This function perform calculation of different Length unit conersion.
     
    */
    func calLength() {
        
        switch inputPickerIndex {
            
        case 0:
            convertResult = Double(userInput.text!)! * LengthAttributes.instance.NANO_METER_RATIO[outputPickerIndex]
            
        case 1:
            convertResult = Double(userInput.text!)! * LengthAttributes.instance.MICRO_METER_RATIO[outputPickerIndex]
            
        case 2:
            convertResult = Double(userInput.text!)! * LengthAttributes.instance.MILLI_METER_RATIO[outputPickerIndex]
            
        case 3:
            convertResult = Double(userInput.text!)! * LengthAttributes.instance.CENTI_METER_RATIO[outputPickerIndex]
            
        case 4:
            convertResult = Double(userInput.text!)! * LengthAttributes.instance.DECI_METER_RATIO[outputPickerIndex]
            
        case 5:
            convertResult = Double(userInput.text!)! * LengthAttributes.instance.METER_RATIO[outputPickerIndex]
            
        case 6:
            convertResult = Double(userInput.text!)! * LengthAttributes.instance.KILO_METER_RATIO[outputPickerIndex]
            
        case 7:
            convertResult = Double(userInput.text!)! * LengthAttributes.instance.INCH_RATIO[outputPickerIndex]
            
        case 8:
            convertResult = Double(userInput.text!)! * LengthAttributes.instance.FOOT_RATIO[outputPickerIndex]
            
        case 9:
            convertResult = Double(userInput.text!)! * LengthAttributes.instance.YARD_RATIO[outputPickerIndex]
            
        case 10:
            convertResult = Double(userInput.text!)! * LengthAttributes.instance.MILE_RATIO[outputPickerIndex]
            
        default:
            print("Not able to catch user selection for Length Convert")
        }
        
    }
    
    /**
     This function perform calculation of different Mass unit conersion.
     
     */
    func calMass() {
        
        switch inputPickerIndex {
            
        case 0:
            convertResult = Double(userInput.text!)! * MassAttributes.instance.NANO_GRAM_RATIO[outputPickerIndex]
            
        case 1:
            convertResult = Double(userInput.text!)! * MassAttributes.instance.MICRO_GRAM_RATIO[outputPickerIndex]
            
        case 2:
            convertResult = Double(userInput.text!)! * MassAttributes.instance.MILLI_GRAM_RATIO[outputPickerIndex]
            
        case 3:
            convertResult = Double(userInput.text!)! * MassAttributes.instance.GRAM_RATIO[outputPickerIndex]
            
        case 4:
            convertResult = Double(userInput.text!)! * MassAttributes.instance.KILO_GRAM_RATIO[outputPickerIndex]
            
        case 5:
            convertResult = Double(userInput.text!)! * MassAttributes.instance.METRIC_TON_RATIO[outputPickerIndex]
            
        case 6:
            convertResult = Double(userInput.text!)! * MassAttributes.instance.OUNCE_RATIO[outputPickerIndex]
            
        case 7:
            convertResult = Double(userInput.text!)! * MassAttributes.instance.POUND_RATIO[outputPickerIndex]
            
        case 8:
            convertResult = Double(userInput.text!)! * MassAttributes.instance.STONE_RATIO[outputPickerIndex]
            
        case 9:
            convertResult = Double(userInput.text!)! * MassAttributes.instance.US_TON_RATIO[outputPickerIndex]
            
        case 10:
            convertResult = Double(userInput.text!)! * MassAttributes.instance.IMPERIAL_TON_RATIO[outputPickerIndex]
            
        default:
            print("Not able to catch user selection for Mass Convert")
            
        }
        
        
    }
    
    /**
     This function perform calculation of different Volume unit conersion.
     
     */
    func calVolume(){
        
        switch inputPickerIndex {
            
        case 0:
            convertResult = Double(userInput.text!)! * VolumeAttributes.instance.MILLI_LITER_RATIO[outputPickerIndex]
        case 1:
            convertResult = Double(userInput.text!)! * VolumeAttributes.instance.LITER_RATIO[outputPickerIndex]
        case 2:
            convertResult = Double(userInput.text!)! * VolumeAttributes.instance.CUBIC_METER_RATIO[outputPickerIndex]
        case 3:
            convertResult = Double(userInput.text!)! * VolumeAttributes.instance.CUBIC_INCH_RATIO[outputPickerIndex]
        case 4:
            convertResult = Double(userInput.text!)! * VolumeAttributes.instance.CUBIC_FOOT_RATIO[outputPickerIndex]
        case 5:
            convertResult = Double(userInput.text!)! * VolumeAttributes.instance.US_FLUID_OUNCE_RATIO[outputPickerIndex]
        case 6:
            convertResult = Double(userInput.text!)! * VolumeAttributes.instance.US_CUP_RATIO[outputPickerIndex]
        case 7:
            convertResult = Double(userInput.text!)! * VolumeAttributes.instance.US_LIQUID_PINT[outputPickerIndex]
        case 8:
            convertResult = Double(userInput.text!)! * VolumeAttributes.instance.US_LIQUID_QUART[outputPickerIndex]
        case 9:
            convertResult = Double(userInput.text!)! * VolumeAttributes.instance.US_LIQUID_GALLON[outputPickerIndex]
            
            
        default:
            print("Not able to catch user selection for Volume Convert")
        }
        
    }
    
    /**
     This function perform calculation of different Temperature unit conersion.
     
     */
    func calTemperatrue(){
        
        switch inputPickerIndex {
            
        case 0:
            
            switch outputPickerIndex {
              
            case 0:
                convertResult = Double(userInput.text!)!
            case 1:
                convertResult = Double(userInput.text!)! * 1.8 + 32
            case 2:
                convertResult = Double(userInput.text!)! + 273.15
            default:
                print("Not able to catch user selection for Celsius")
                
            }
            
        case 1:
            
            switch outputPickerIndex {
                
            case 0:
                convertResult = (Double(userInput.text!)! - 32) / 1.8
            case 1:
                convertResult = Double(userInput.text!)!
            case 2:
                convertResult = (Double(userInput.text!)! + 459.67) * 5.0 / 9
                
            default:
                print("Not able to catch user selection for Fahrenheit")
            }
            
        case 2:
            
            switch outputPickerIndex {
                
            case 0:
                convertResult = Double(userInput.text!)! - 273.15
            case 1:
                convertResult = 1.8 * (Double(userInput.text!)! - 273.15) + 32
            case 2:
                convertResult = Double(userInput.text!)!
            default:
                print("Not able to catch user selection for Kelvin")
                
            }
            
        default:
            print("Not able to catch user selection for Temperature Convert")
        }
        
    }
    
    /**
     This function perform calculation of different Time unit conersion.
     
     */
    func calTime(){
        
        switch inputPickerIndex {
            
        case 0:
            convertResult = Double(userInput.text!)! * TimeAttributes.instance.NANO_SECOND_RATIO[outputPickerIndex]
        case 1:
            convertResult = Double(userInput.text!)! * TimeAttributes.instance.MICRO_SECOND_RATIO[outputPickerIndex]
        case 2:
            convertResult = Double(userInput.text!)! * TimeAttributes.instance.MILLI_SECOND_RATIO[outputPickerIndex]
        case 3:
            convertResult = Double(userInput.text!)! * TimeAttributes.instance.SECOND_RATIO[outputPickerIndex]
        case 4:
            convertResult = Double(userInput.text!)! * TimeAttributes.instance.MINUTE_RATIO[outputPickerIndex]
        case 5:
            convertResult = Double(userInput.text!)! * TimeAttributes.instance.HOUR_RATIO[outputPickerIndex]
        case 6:
            convertResult = Double(userInput.text!)! * TimeAttributes.instance.DAY_RATIO[outputPickerIndex]
        case 7:
            convertResult = Double(userInput.text!)! * TimeAttributes.instance.WEEK_RATIO[outputPickerIndex]
        case 8:
            convertResult = Double(userInput.text!)! * TimeAttributes.instance.MONTH_RATIO[outputPickerIndex]
        case 9:
            convertResult = Double(userInput.text!)! * TimeAttributes.instance.YEAR_RATIO[outputPickerIndex]
        case 10:
            convertResult = Double(userInput.text!)! * TimeAttributes.instance.DECADE_RATIO[outputPickerIndex]
        case 11:
            convertResult = Double(userInput.text!)! * TimeAttributes.instance.CENTURY_RATIO[outputPickerIndex]
            
        default:
            print("Not able to catch user selection for Time Convert")
        }
        
    }
    
    /**
     This function perform calculation of different Speed unit conersion.
     
     */
    func calSpeed(){
        
        switch inputPickerIndex {
            
        case 0:
            convertResult = Double(userInput.text!)! * SpeedAttributes.instance.METER_PER_SECOND_RATIO[outputPickerIndex]
            
        case 1:
            convertResult = Double(userInput.text!)! * SpeedAttributes.instance.KILO_METER_PER_HOUR_RATIO[outputPickerIndex]
            
        case 2:
            convertResult = Double(userInput.text!)! * SpeedAttributes.instance.FOOT_PER_SECOND_RATIO[outputPickerIndex]
            
        case 3:
            convertResult = Double(userInput.text!)! * SpeedAttributes.instance.MILE_PER_HOUR_RATIO[outputPickerIndex]
            
        case 4:
            convertResult = Double(userInput.text!)! * SpeedAttributes.instance.KNOT_RATIO[outputPickerIndex]
            
        default:
            print("Not able to catch user selection for Speed Convert")
        }
        
    }
    
}

/**
 This extension of String perfrom valid double number check for all String.
 
 */
extension String {
    
    func isDouble() -> Bool {
        if Double(self) == nil && !self.isEmpty{
            return false
        }else{
            return true
        }
    }
    
}

/**
 This extension of Double enable the scientific model for all Double
 
 */
extension Double {
    
    struct Number {
        static var formatter = NumberFormatter()
    }
    
    var scientificStyle: String {
        Number.formatter.numberStyle = .scientific
        Number.formatter.exponentSymbol = Attributes.instance.EXPONENTSYMBOL
        let number = NSNumber(value: self)
        return Number.formatter.string(from :number) ?? description
    }
    
}







