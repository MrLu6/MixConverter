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
        
        if Attributes.instance.LENGTH_COVERT_IS_ON {
            
            inputUnitLabel.text = "nm"
            outputUnitLabel.text = "nm"
            
        }else if Attributes.instance.MASS_CONVERT_IS_ON {
            
            inputUnitLabel.text = "ng"
            outputUnitLabel.text = "ng"
            
        }else if Attributes.instance.VOLUME_CONVERT_IS_ON {
            
            inputUnitLabel.text = "ml"
            outputUnitLabel.text = "ml"
            
        }
        
        backToMenu()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 3 {
            
            return Attributes.instance.DECIMAL_PLACE_ARRAY.count
            
        }else {
            
            if Attributes.instance.LENGTH_COVERT_IS_ON {
                
              return LengthAttributes.instance.LENGTH_UNITS_ARRAY.count
                
            } else if Attributes.instance.MASS_CONVERT_IS_ON {
               
              return MassAttributes.instance.MASS_UNITS_ARRAY.count
            }
            
            return VolumeAttributes.instance.VOLUME_UNITS_ARRAY.count
            
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 3 {
            
            return Attributes.instance.DECIMAL_PLACE_ARRAY[row]
            
        }
        else {
            if Attributes.instance.LENGTH_COVERT_IS_ON {
                return LengthAttributes.instance.LENGTH_UNITS_ARRAY[row]
            }else if Attributes.instance.MASS_CONVERT_IS_ON{
                return MassAttributes.instance.MASS_UNITS_ARRAY[row]
            }
            
            return VolumeAttributes.instance.VOLUME_UNITS_ARRAY[row]
            
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        inputPickerIndex = inputPicker.selectedRow(inComponent: 0)
        outputPickerIndex = outputPicker.selectedRow(inComponent: 0)
        decimalPlaceIndex = decimalPlacePicker.selectedRow(inComponent: 0)
        
        if Attributes.instance.LENGTH_COVERT_IS_ON {
            
            inputUnitLabel.text = LengthAttributes.instance.LENGTH_UNITS_SHORT_ARRAY[inputPickerIndex]
            outputUnitLabel.text = LengthAttributes.instance.LENGTH_UNITS_SHORT_ARRAY[outputPickerIndex]
            
        }else if Attributes.instance.MASS_CONVERT_IS_ON {
            
            inputUnitLabel.text = MassAttributes.instance.MASS_UNITS_SHORT_ARRAY[inputPickerIndex]
            outputUnitLabel.text = MassAttributes.instance.MASS_UNITS_SHORT_ARRAY[outputPickerIndex]
            
        }else if Attributes.instance.VOLUME_CONVERT_IS_ON {
            
            inputUnitLabel.text = VolumeAttributes.instance.VOLUME_UNITS_SHORT_ARRAY[inputPickerIndex]
            outputUnitLabel.text = VolumeAttributes.instance.VOLUME_UNITS_SHORT_ARRAY[outputPickerIndex]
            
        }
     
        displayConversionResult()

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for txt in self.view.subviews {
            if txt.isKind(of: UITextField.self) && txt.isFirstResponder {
                txt.resignFirstResponder()
            }
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
            
            if Attributes.instance.LENGTH_COVERT_IS_ON {
                 calLengthConvertResult()
            }else if Attributes.instance.MASS_CONVERT_IS_ON {
                calMassConvertResult()
            }else if Attributes.instance.VOLUME_CONVERT_IS_ON {
                calVolumeConvertResult()
            }
           
        
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
    
    
    func calLengthConvertResult() {
        
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
            print("Not able to catch user selection")
        }
        
    }
    
    func calMassConvertResult() {
        
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
            print("Not able to catch user selection")
            
            
        }
        
        
    }
    
    func calVolumeConvertResult(){
        
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
            print("Not able to catch user selection")
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
            
            while convertResultUpToE.count < decimalPlaceIndex + 2 {
                convertResultUpToE.append("0")
            }
            
            convertResultUpToE = String(format: Attributes.instance.DECIMAL_PLACE_FORMAT_ARRAY[decimalPlaceIndex], Double (convertResultUpToE)!)
            print("unsimplyReuslt" + convertResultString)
            print("round answer" + convertResultUpToE)
           
            let converResultStringEndIndex = convertResultUpToE.index(convertResultString.startIndex, offsetBy: decimalPlaceIndex + 2)
            
            let roundDecimal = convertResultUpToE[convertResultString.startIndex..<converResultStringEndIndex]
            
            return String(roundDecimal + Attributes.instance.EXPONENTSYMBOL + power)
            
        }
        
        return convertResultString
        
    }
    
    func backToMenu(){
        MenuButton.target = self.revealViewController()
        MenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        self.revealViewController().rearViewRevealWidth = 100
        
    view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }

    
    
    
}

extension String{
    
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







