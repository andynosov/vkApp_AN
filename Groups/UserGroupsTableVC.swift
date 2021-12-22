//
//  UserGroupsTableViewController.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 16.12.2021.
//

import UIKit

class UserGroupsTableVC: UITableViewController {
    
    
    @IBAction func toGlobalGroupsButton(segue: UIStoryboardSegue){
        if segue.identifier == "addGroup"{
            guard let GlobalGroupsVC = segue.source as? GlobalGroupsTableVC else {return}
            if let indexPath = GlobalGroupsVC.tableView.indexPathForSelectedRow {
                let selectedGroup = GlobalGroupsVC.globalGroups[indexPath.row]
                print(selectedGroup)
                if !groups.contains(selectedGroup) {
                    groups.append(selectedGroup)
                    tableView.reloadData()
                }
            }
        }
    }
    
    
    var groups: [Group] = [
        Group(name: "John Lennon official",
              profileImage:"johnlennon"),
        Group(name: "VAZ lovers",
              profileImage:  "vaz")
    ]
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}


