//
//  HomeViewController.swift
//  MixConverter
//
//  Created by CHENGJUN LU on 9/27/18.
//  Copyright © 2018 CHENGJUN LU. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!

    @IBAction func OpenConvertScreen(_ sender: UIButton) {
        
        let btnTitle = sender.currentTitle!
        
        self.revealViewController().rearViewController.performSegue(withIdentifier: btnTitle, sender: self.revealViewController().rearViewController)
        
        enableSelectedConverter(sender: sender)
        
    }
    
    override func viewDidLoad() {
        
        menuButton.target = self.revealViewController()
        menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        self.revealViewController().rearViewRevealWidth = 100
        
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
    }
    
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
            
        default:
            print("Error")
            
        }
        
    }
    
}
