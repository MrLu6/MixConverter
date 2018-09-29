//
//  ViewController.swift
//  MixConverter
//
//  Created by CHENGJUN LU on 9/24/18.
//  Copyright © 2018 CHENGJUN LU. All rights reserved.
//

import UIKit

class MixConvertViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {
        
    var convertResult = 0.00
    
    var convertResultString = String(0.00)
    
    var inputPickerIndex = 0
    
    var outputPickerIndex = 0
    
    var decimalPlaceIndex = 2
    
    var isScientific = false
    
    
    @IBOutlet weak var MenuButton: UIBarButtonItem!
    
    @IBOutlet weak var userInput: UITextField!
    
    @IBAction func userInputChanged(_ sender: UITextField) {
        
       displayConversionResult()
        
    }
    
    @IBOutlet weak var displayResult: UITextField!
    
    @IBOutlet weak var inputUnitLabel: UILabel!
    
    @IBOutlet weak var outputUnitLabel: UILabel!
    
    @IBOutlet weak var inputPicker: UIPickerView!
    
    @IBOutlet weak var outputPicker: UIPickerView!
    
    @IBOutlet weak var decimalPlacePicker: UIPickerView!
    
    @IBOutlet weak var scientificNotationSwitchBtn: UISwitch!
    
    @IBAction func scientificNotationSwitch(_ sender: UISwitch) {
        
        if sender.isOn {
            
            isScientific = true
            
        }else{
            
            isScientific = false
            
        }
        
        displayConversionResult()
        
    }
    
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for txt in self.view.subviews {
            if txt.isKind(of: UITextField.self) && txt.isFirstResponder {
                txt.resignFirstResponder()
            }
        }
        
    }
    
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
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 3 {
            
            return Attributes.instance.DECIMAL_PLACE_ARRAY.count
            
        }else {
           
            return numRowOfSelectType()
           
        }
    }
    
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
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 3 {
            
            return Attributes.instance.DECIMAL_PLACE_ARRAY[row]
            
        }
        else {
            
            return displaySelectTypeUnits(row: row)
            
        }
    }
    
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        inputPickerIndex = inputPicker.selectedRow(inComponent: 0)
        outputPickerIndex = outputPicker.selectedRow(inComponent: 0)
        decimalPlaceIndex = decimalPlacePicker.selectedRow(inComponent: 0)
        
        displaySelectTypeShort()
        displayConversionResult()

    }
    
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
            inputUnitLabel.text = SpeedAttributes.instance.SPEED_UNITS_SHORT_ARRAY[outputPickerIndex]
            
        }
        
    }
    
    func displayConversionResult(){
        
        if (!userInput.text!.isDouble() && !userInput.text!.isEmpty ){
            
            displayResult.text = Attributes.instance.USER_INPUT_WARNING
            
        }
        else if userInput.text!.isEmpty{
            if isScientific{
                
                displayResult.text = Double(0).scientificStyle
                
            }else{
                
                displayResult.text = String(format:Attributes.instance.DECIMAL_PLACE_FORMAT_ARRAY[decimalPlaceIndex],0)
                
            }
            
        }else {
            
            calSelectTypeConversion()
            
            convertResultString = String(convertResult)
      
            if isScientific {
                
                convertResultString = convertResult.scientificStyle
                
                displayResult.text = scientificToDecimal()

            }else{
                
                displayResult.text = String(format:Attributes.instance.DECIMAL_PLACE_FORMAT_ARRAY[decimalPlaceIndex],convertResult)
                
                convertResult = Double(displayResult.text!)!
            }

        }
        
    }
    
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
    
    
    func scientificToDecimal() -> String{
        
        if let eIndex = convertResultString.range(of: Attributes.instance.EXPONENTSYMBOL)?.lowerBound {
            
            let powerStartIndex = convertResultString.index(eIndex, offsetBy: 1)
            let power = convertResultString[powerStartIndex..<convertResultString.endIndex]
            
            var convertResultUpToE = String(convertResultString[..<eIndex])
            
            if !convertResultUpToE.contains(Attributes.instance.DECIMAL_POINT){
                convertResultUpToE.append(Attributes.instance.DECIMAL_POINT)
            }
            
            while convertResultUpToE.count < decimalPlaceIndex + Attributes.instance.TWO {
                convertResultUpToE.append("0")
            }
            
            convertResultUpToE = String(format: Attributes.instance.DECIMAL_PLACE_FORMAT_ARRAY[decimalPlaceIndex], Double (convertResultUpToE)!)
            
           
            let converResultStringEndIndex = convertResultUpToE.index(convertResultString.startIndex, offsetBy: decimalPlaceIndex + Attributes.instance.TWO)
            
            let roundDecimal = convertResultUpToE[convertResultString.startIndex..<converResultStringEndIndex]
            
            return String(roundDecimal + Attributes.instance.EXPONENTSYMBOL + power)
            
        }
        
        return convertResultString
        
    }
    
    func backToMenu(){
        MenuButton.target = self.revealViewController()
        MenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        self.revealViewController().rearViewRevealWidth = Attributes.instance.REAR_VIEW_REVEAL_WIDTH
        
    view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
    }

}

//calculate unsimply unit conversion for all types
extension MixConvertViewController {
    
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

extension String {
    
    func isDouble() -> Bool {
        if Double(self) == nil && !self.isEmpty{
            return false
        }else{
            return true
        }
    }
    
}

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







