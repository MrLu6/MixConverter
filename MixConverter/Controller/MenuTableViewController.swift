//
//  MenuTableViewController.swift
//  MixConverter
//
//  Created by CHENGJUN LU on 9/27/18.
//  Copyright © 2018 CHENGJUN LU. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    var menuOption = ["Home","Length", "Mass", "Volume", "Temperature", "Time", "Speed"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOption.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: menuOption[indexPath.row], for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = menuOption[indexPath.row]
        
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: menuOption[indexPath.row], sender: self)
        
        enableSelectedConverter(indexPath: indexPath)
        
    }
    
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
            print("Error")
            
        }
        
    }
    
    
    
}
