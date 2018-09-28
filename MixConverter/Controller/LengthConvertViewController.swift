//
//  ViewController.swift
//  MixConverter
//
//  Created by CHENGJUN LU on 9/24/18.
//  Copyright © 2018 CHENGJUN LU. All rights reserved.
//

import UIKit

class LengthConvertViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {

    let lengthUnitsArray = ["Nanometer", "MicroMeter", "Millimeter", "Centimeter", "Decimeter", "Meter", "Kilometer", "Inch", "Foot", "Yard","Mile"]
    
    let lengthUnitsShortArray = ["nm", "μm", "mm", "cm", "dm", "m", "km", "inch", "ft", "yard","mile"]
    
    let nanometerToAllArray = [1, 0.001, 0.000001, 0.0000001, 0.00000001 ,0.000000001, 0.000000000001, 1/25400000, 1/25400000/12, 1/25400000/12/3, 1/25400000/12/3/1760] as [Double]
    
    let microMeterToAllArray = [1000, 1, 0.001, 0.0001, 0.00001,0.000001, 0.000000001, 1/25400, 1/25400/12, 1/25400/12/3, 1/25400/12/3/1760] as [Double]
    
    let milimeterToAllArray = [1000000, 1000,1, 0.1, 0.01, 0.001,0.000001, 1/25.4, 1/25.4/12, 1/25.4/12/3, 1/25.4/12/3/1760]
    
    let centimeterToAllArray = [10000000, 10000,10, 1, 0.1, 0.01, 0.00001, 1/2.54, 1/2.54/12, 1/2.54/12/3, 1/2.54/12/3/1760]
    
    let decimeterToAllArray = [100000000, 100000,100, 10, 1, 0.1, 0.0001, 1/0.254, 1/0.254/12, 1/0.254/12/3, 1/0.254/12/3/1760]
    
    let meterToAllArray = [1000000000, 1000000,1000, 100, 10, 1, 0.001, 1/0.0254, 1/0.0254/12, 1/0.0254/12/3, 1/0.0254/12/3/1760]
    
    let kilometerToAllArray = [1000000000000, 1000000000,1000000, 100000, 10000, 1000, 1, 1/0.0000254, 1/0.0000254/12, 1/0.0000254/12/3, 1/0.0000254/12/3/1760]
    
    let inchToAllArray = [25400000, 25400, 25.4, 2.54, 0.254, 0.0254, 0.0000254, 1, 1/12, 1/12 * (1/3), 1/12*(1/3)*(1/1760) ] as [Double]
    
    let footToAllArray = [25400000 * 12, 25400 * 12, 25.4 * 12, 2.54 * 12, 0.254 * 12, 0.0254 * 12, 0.0000254 * 12, 12, 1, 1/3, (1/3)*(1/1760) ] as [Double]
    
    let yardToAllArray = [25400000 * 12 * 3, 25400 * 12 * 3, 25.4 * 12 * 3, 2.54 * 12 * 3, 0.254 * 12 * 3, 0.0254 * 12 * 3, 0.0000254 * 12 * 3, 36, 3, 1, 1/1760 ] as [Double]
    
    let mileToAllArray = [25400000 * 12 * 3 * 1760, 25400 * 12 * 3 * 1760, 25.4 * 12 * 3 * 1760, 2.54 * 12 * 3 * 1760, 0.254 * 12 * 3 * 1760, 0.0254 * 12 * 3 * 1760, 0.0000254 * 12 * 3 * 1760, 63360, 5280, 1760, 1 ] as [Double]
    
    var convertResult = 0.00
    var convertResultString = String(0.00)
    var inputPickerIndex = 0
    var outputPickerIndex = 0
    var decimalPlaceIndex = 2
    var isScientific = false
    
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
        decimalPlacePicker.selectRow(2, inComponent: 0, animated: true)
        
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
            
            return lengthUnitsArray.count
            
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 3 {
            
            return Attributes.instance.DECIMAL_PLACE_ARRAY[row]
            
        }
        else {
            
            return lengthUnitsArray[row]
            
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        inputPickerIndex = inputPicker.selectedRow(inComponent: 0)
        outputPickerIndex = outputPicker.selectedRow(inComponent: 0)
        decimalPlaceIndex = decimalPlacePicker.selectedRow(inComponent: 0)
        
        inputUnitLabel.text = lengthUnitsShortArray[inputPickerIndex]
        outputUnitLabel.text = lengthUnitsShortArray[outputPickerIndex]
        
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
            
        }else if inputPickerIndex >= 0 && inputPickerIndex <= 10 && (userInput.text?.isDouble())!{
            
            calConvertResult()
        
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
    
    
    func calConvertResult() {
        
        switch inputPickerIndex {
            
        case 0:
            convertResult = Double(userInput.text!)! * nanometerToAllArray[outputPickerIndex]
            
        case 1:
            convertResult = Double(userInput.text!)! * microMeterToAllArray[outputPickerIndex]
            
        case 2:
            convertResult = Double(userInput.text!)! * milimeterToAllArray[outputPickerIndex]
            
        case 3:
            convertResult = Double(userInput.text!)! * centimeterToAllArray[outputPickerIndex]
            
        case 4:
            convertResult = Double(userInput.text!)! * decimeterToAllArray[outputPickerIndex]
            
        case 5:
            convertResult = Double(userInput.text!)! * meterToAllArray[outputPickerIndex]
            
        case 6:
            convertResult = Double(userInput.text!)! * kilometerToAllArray[outputPickerIndex]
            
        case 7:
            convertResult = Double(userInput.text!)! * inchToAllArray[outputPickerIndex]
            
        case 8:
            convertResult = Double(userInput.text!)! * footToAllArray[outputPickerIndex]
            
        case 9:
            convertResult = Double(userInput.text!)! * yardToAllArray[outputPickerIndex]
            
        case 10:
            convertResult = Double(userInput.text!)! * mileToAllArray[outputPickerIndex]
            
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
            
           
            let converResultStringEndIndex = convertResultUpToE.index(convertResultString.startIndex, offsetBy: decimalPlaceIndex + 2)
            
            let roundDecimal = convertResultUpToE[convertResultString.startIndex..<converResultStringEndIndex]
            
            return String(roundDecimal + Attributes.instance.EXPONENTSYMBOL + power)
            
        }
        
        return convertResultString
        
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





