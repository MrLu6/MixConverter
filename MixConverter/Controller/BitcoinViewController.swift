//
//  BitcoinViewController.swift
//  MixConverter
//
//  Created by CHENGJUN LU on 10/6/18.
//  Copyright © 2018 CHENGJUN LU. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class BitcoinViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    

    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    let currencySymbolArray = ["$", "R$", "$", "¥", "€", "£", "$", "Rp", "₪", "₹", "¥", "$", "kr", "$", "zł", "lei", "₽", "kr", "$", "$", "R"]
    var currencySelected = ""
    var finalURL = ""
    
    //Pre-setup IBOutlets
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var MenuButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        initalBitcoinPrice()
        backToMenu()
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      
        return currencyArray[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        finalURL = baseURL + currencyArray[row]
        currencySelected = currencySymbolArray[row]
        getBitcoinData(url:finalURL )
    }
    
    func initalBitcoinPrice(){
        
        finalURL = baseURL + currencyArray[0]
        currencySelected = currencySymbolArray[0]
        getBitcoinData(url:finalURL )
        
    }
    
    
    func getBitcoinData(url: String) {

        Alamofire.request(url, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {

                    print("Sucess! Got the Bitcoin data!")
                    let bitcoinJSON : JSON = JSON(response.result.value!)

                    self.updateBitcoinData(json: bitcoinJSON)

                } else {
                    print("Error: \(String(describing: response.result.error))")
                    self.bitcoinPriceLabel.text = "Connection Issues"
                }
            }

    }
    
    
    

    func updateBitcoinData(json : JSON) {

        if let bitcoinResult = json["ask"].double {
            bitcoinPriceLabel.text = currencySelected + String(bitcoinResult)
        }else{
            bitcoinPriceLabel.text = "Price Unavailable"
        }


    
    }
    
    /**
     This function will perform action that go to the slide menu which gesture recognization.
     
     */
    func backToMenu(){
        
        MenuButton.target = self.revealViewController()
        MenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        self.revealViewController().rearViewRevealWidth = Attributes.instance.REAR_VIEW_REVEAL_WIDTH
        
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
    }
}
