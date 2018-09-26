//
//  ViewController.swift
//  MixConverter
//
//  Created by CHENGJUN LU on 9/24/18.
//  Copyright © 2018 CHENGJUN LU. All rights reserved.
//

import UIKit

class LengthConvertViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {

    let lengthUnitsArray = ["Millimeter", "Centimeter", "Delimter", "Meter", "Kilometer", "Inch","Feet","Yard","Mile"]
    
    let lengthUnitsShortArray = ["mm", "cm", "dm", "m", "km", "inch", "ft", "yard","mile"]
    
    let decimalPlaceArray = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    let milimeterToAllArray = [1, 0.1, 0.01, 0.001,0.0001, 1/25.4, 1/25.4/12, 1/25.4/12/3, 1/25.4/12/3/1760]
    
    
    var convertResult = 0.00
    var inputPickerIndex = 0
    var outputPickerIndex = 0
    var decimalPlaceIndex = 2
    
    
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
            Attributes.instance.isScientific = true
        }else{
            Attributes.instance.isScientific = false
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
        
        inputPicker.tag = 1
        outputPicker.tag = 2
        decimalPlacePicker.tag = 3
        
        
        displayResult.isEnabled = false
        decimalPlacePicker.selectRow(2, inComponent: 0, animated: true)
        
//        print(0.05.scientificFormatted)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 3 {
            return decimalPlaceArray.count
        }else {
            return lengthUnitsArray.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 3 {
            return decimalPlaceArray[row]
        }
        else {
            return lengthUnitsArray[row]
        }
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        inputPickerIndex = inputPicker.selectedRow(inComponent: 0)
        outputPickerIndex = outputPicker.selectedRow(inComponent: 0)
        decimalPlaceIndex = decimalPlacePicker.selectedRow(inComponent: 0)
        Attributes.instance.scientificPlaceIndex = decimalPlacePicker.selectedRow(inComponent: 0)
        print("selectIndex \(Attributes.instance.scientificPlaceIndex)")
        
        inputUnitLabel.text = lengthUnitsShortArray[inputPickerIndex]
        outputUnitLabel.text = lengthUnitsShortArray[outputPickerIndex]
        
        if inputPickerIndex == 0 {
            convertResult = Double(userInput.text!)!*milimeterToAllArray[outputPickerIndex]
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
            
            displayResult.text = String("Wrong input")
        }
        else if userInput.text!.isEmpty{
            if Attributes.instance.isScientific{
                
                displayResult.text = 0.scientificFormatted
                
            }else{
                displayResult.text = String(format:Attributes.instance.decimalPlaceFormatArray[decimalPlaceIndex],0)
            }
            
        }else if inputPickerIndex == 0 && (userInput.text?.isDouble())!{
            
            convertResult = Double(userInput.text!)!*milimeterToAllArray[outputPickerIndex]
            
           
             displayResult.text = String(format:Attributes.instance.decimalPlaceFormatArray[decimalPlaceIndex],convertResult)
            convertResult = Double(displayResult.text!)!
             print("convertResult after format\(convertResult)")
            if Attributes.instance.isScientific {
                //convertResult
                displayResult.text = convertResult.scientificFormatted
                print("convertResult\(convertResult)")
               
            }

        }
        
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

extension Formatter{
    
    static var scientific: NumberFormatter = {
        print("I get called")
        var formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.positiveFormat = Attributes.instance.scientificNotationFormatArray[Attributes.instance.scientificPlaceIndex]
        print("selectIndex in Formatter\(formatter.positiveFormat)")
        formatter.exponentSymbol = "e"
        return formatter
    }()
}

extension Numeric {
    var scientificFormatted: String {
        return Formatter.scientific.string(for: self) ?? ""
    }
}



