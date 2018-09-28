//
//  HomeViewController.swift
//  MixConverter
//
//  Created by CHENGJUN LU on 9/27/18.
//  Copyright © 2018 CHENGJUN LU. All rights reserved.
//

import Foundation


import Foundation

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        
        menuButton.target = self.revealViewController()
        menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        self.revealViewController().rearViewRevealWidth = 100
        
    view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    

    @IBAction func OpenConvertScreen(_ sender: UIButton) {
        
        let btnTitle = sender.currentTitle!
        self.revealViewController().rearViewController.performSegue(withIdentifier: btnTitle, sender: self.revealViewController().rearViewController)
    }
    
}
