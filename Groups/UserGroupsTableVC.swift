//
//  UserGroupsTableViewController.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 16.12.2021.
//

import UIKit

class UserGroupsTableVC: UITableViewController {
    
    
    @IBOutlet weak var toGlobalGroupsButton: UIBarButtonItem!
    
    
    
    var groups: [Group] = [
        Group(name: "John Lennon official", profileImage:"johnlennon"),
        Group(name: "VAZ lovers", profileImage:  "vaz")
    ]
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserGroupCell", for: indexPath) as? GroupTableViewCell else {return UITableViewCell()}
        cell.groupName.text = groups[indexPath.row].name
        cell.groupImage.image = UIImage(named: groups[indexPath.row].profileImage)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    
        
    }
    
}
    
//
