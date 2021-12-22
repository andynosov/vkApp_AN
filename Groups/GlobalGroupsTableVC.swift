//
//  GlobalGroupsTableViewController.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 18.12.2021.
//

import UIKit

class GlobalGroupsTableVC: UITableViewController {

    var globalGroups: [Group] = [
        Group(name: "Make America Great Again", profileImage:"donald"),
        Group(name: "SwiftUI", profileImage:  "coding")
    ]
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return globalGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GlobalGroupsCell", for: indexPath) as? GlobalGroupsCell else {return UITableViewCell()}
        cell.groupName.text = globalGroups[indexPath.row].name
        cell.groupImage.image = UIImage(named: globalGroups[indexPath.row].profileImage)
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
    
    
    
    
    
    
    
    
}



