//
//  MenuTableViewController.swift
//  MixConverter
//
//  Created by CHENGJUN LU on 9/27/18.
//  Copyright © 2018 CHENGJUN LU. All rights reserved.
//

import Foundation

class MenuTableViewController: UITableViewController {
    
    var menuOption = ["Home","Length", "Weight", "Volume", "Temperature", "Time"]
    
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
    }
    
    
    
}