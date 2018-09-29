//
//  MenuTableViewController.swift
//  MixConverter
//
//  Created by CHENGJUN LU on 9/27/18.
//  Copyright © 2018 CHENGJUN LU. All rights reserved.
//

import Foundation

class MenuTableViewController: UITableViewController {
    
    var menuOption = ["Home","Length", "Mass", "Volume", "Temperature", "Time"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOption.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: menuOption[indexPath.row], for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = menuOption[indexPath.row]
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 1 {
            Attributes.instance.LENGTH_COVERT_IS_ON = true
            Attributes.instance.MASS_CONVERT_IS_ON = false
            Attributes.instance.VOLUME_CONVERT_IS_ON = false
        }else if indexPath.row == 2 {
            
            Attributes.instance.MASS_CONVERT_IS_ON = true
            Attributes.instance.LENGTH_COVERT_IS_ON = false
            Attributes.instance.VOLUME_CONVERT_IS_ON = false

        }else if indexPath.row == 3 {
            
            Attributes.instance.VOLUME_CONVERT_IS_ON = true
            Attributes.instance.LENGTH_COVERT_IS_ON = false
            Attributes.instance.MASS_CONVERT_IS_ON = false
            
        }else if indexPath.row == 4 {
            
            Attributes.instance.TEMPERATRUE_CONVERT_IS_ON = true
            Attributes.instance.LENGTH_COVERT_IS_ON = false
            Attributes.instance.MASS_CONVERT_IS_ON = false
            Attributes.instance.VOLUME_CONVERT_IS_ON = false
            
        }
        
        self.performSegue(withIdentifier: menuOption[indexPath.row], sender: self)
    }
    
    
    
}
