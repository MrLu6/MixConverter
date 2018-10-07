//
//  HomeViewController.swift
//  MixConverter
//
//  Created by CHENGJUN LU on 9/27/18.
//  Copyright © 2018 CHENGJUN LU. All rights reserved.
//

import UIKit

/**
 This class handles all user interactions of HomeViewController.
 Enter the type of converter which user selected.
 */
class HomeViewController: UIViewController {
    
    ///Button which go back to slide menu.
    @IBOutlet weak var menuButton: UIBarButtonItem!

    /**
     This function will send user to the type of converter through the buttons they tap.
     
      - See Also: enableSelectedConverter(sender: sender).
     
     */
    @IBAction func OpenConvertScreen(_ sender: UIButton) {
        
        let btnTitle = sender.currentTitle!
        
        self.revealViewController().rearViewController.performSegue(withIdentifier: btnTitle, sender: self.revealViewController().rearViewController)
        
        enableSelectedConverter(sender: sender)
        
    }
    
    /**
        This function will do some SWRevealViewController set up such as
        rearViewRevealWidth(The display width of slide menu) and gestture
        recognization.
     */
    override func viewDidLoad() {
        
        menuButton.target = self.revealViewController()
        menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        self.revealViewController().rearViewRevealWidth = Attributes.instance.REAR_VIEW_REVEAL_WIDTH
        
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
    }
    
    /**
     This function called the corresponding enableUnitConverter funcation to set values
     of all unit converter indicator based on button which user tap.
     
        - See Also: All enable unti converter functions in Attributes.swift
     */
    func enableSelectedConverter(sender: UIButton) {
        
        switch sender.tag {
            
        case 1:
            Attributes.instance.enableLengthConverter()
            
        case 2:
            Attributes.instance.enableMassConverter()
        
        case 3:
            Attributes.instance.enableVolumeConverter()
        
        case 4:
            Attributes.instance.enableTemperatureConverter()
        
        case 5:
            Attributes.instance.enableTimeConverter()
            
        case 6:
            Attributes.instance.enableSpeedConverter()
            
        case 7:
            Attributes.instance.enableBitcoinConverter()
            
        default:
            print("Not able to catch the button tag")
            
        }
        
    }
    
}
