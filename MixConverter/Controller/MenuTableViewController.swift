//
//  MenuTableViewController.swift
//  MixConverter
//
//  Created by CHENGJUN LU on 9/27/18.
//  Copyright © 2018 CHENGJUN LU. All rights reserved.
//

import UIKit

/**
 This class handles all user interactions of MenuTableViewController.
 Tap the cell on the slide menu to enter the corresponding type of converter.
 */
class MenuTableViewController: UITableViewController {
    
    let menuOption = ["Home", "Length", "Mass", "Volume", "Temperature", "Time", "Speed"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOption.count
    }
    
    /**
     This function will set up the cell and its cotent of the slide menu.
     
     */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: menuOption[indexPath.row], for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = menuOption[indexPath.row]
        
        return cell;
    }
    
    /**
     This function will send user to the type of converter through the cells they tap.
     
     - See Also: enableSelectedConverter(indexPath: IndexPath).
     
     */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: menuOption[indexPath.row], sender: self)
        
        enableSelectedConverter(indexPath: indexPath)
        
    }
    
    /**
     This function called the corresponding enableUnitConverter funcation to set values
     of all unit converter indicator based on button which user tap.
     
     - See Also: All enable unti converter functions in Attributes.swift
     
     */
    func enableSelectedConverter(indexPath: IndexPath) {
        
        switch indexPath.row {
        
        case 0:
            Attributes.instance.disableAllConverter()
        
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
            print("Not able to catch the indexPath row")
            
        }
        
    }
    
}
