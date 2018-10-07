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

/**
 This class handles all user interactions of BitcoinViewController
 Display the latest bitcoin price which corresponding currency based on user selection.
 */
class BitcoinViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    
    ///Bitcoin Price API Web URL
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    
    ///Abbreviations for currencies
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    ///Symbols for currencies
    let currencySymbolArray = ["$", "R$", "$", "¥", "€", "£", "$", "Rp", "₪", "₹", "¥", "$", "kr", "$", "zł", "lei", "₽", "kr", "$", "$", "R"]
    
    ///The selected currency symbol
    var currencySymbolSelected = ""
    
    ///The complete url for http request
    var finalURL = ""
    
    ///Linked to bitcoinPriceLabel
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    
    ///Linked to currencyPicker
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    ///Linked to back button
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
    
    
    /**
     This function will display the corresponding bitcoin price based on the currecy type which user selected
     
     -SeeAlso: getBitcoinData(url:String)
     
     */
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        finalURL = baseURL + currencyArray[row]
        currencySymbolSelected = currencySymbolArray[row]
        getBitcoinData(url:finalURL )
    }
    
    /**
     This function will inital the bitcoin price which shows the price for the first currecy listed in the pickerView
     
     -SeeAlso: getBitcoinData(url:String)
     
    */
    func initalBitcoinPrice(){
        
        finalURL = baseURL + currencyArray[0]
        currencySymbolSelected = currencySymbolArray[0]
        getBitcoinData(url:finalURL )
        
    }
    
    /**
     This function will send out http request to get the bitcoin JSON data
     
     -parameter url: Selected Bitcoin Price API Web URL
     
     -SeeAlso: updateBitcoinData(json : JSON)
     
     */
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
    
    
    /**
    This function update the bicoin price base the json data the get from the Bitcoin Price API
    
    -parameter json: JSON data for the bitcoin
    
    */
    func updateBitcoinData(json : JSON) {

        if let bitcoinResult = json["ask"].double {
            bitcoinPriceLabel.text = currencySymbolSelected + String(bitcoinResult)
        }else{
            bitcoinPriceLabel.text = "Price Unavailable"
        }


    
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
