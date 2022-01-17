//
//  GlobalGroupsTableViewController.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 18.12.2021.
//

import UIKit

class GlobalGroupsTableVC: UITableViewController {

    var groups: [Group] = [
        Group(
            name: "Make America Great Again",
            profileImage:"donald"),
        Group(
            name: "SwiftUI",
            profileImage:  "coding"),
        Group(
            name: "John Lennon official",
            profileImage:"johnlennon"),
        Group(
            name: "VAZ lovers",
            profileImage:  "vaz")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(
            nibName: "GroupCell",
            bundle: nil),
                           forCellReuseIdentifier: "groupCell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupCell
        else {
            return UITableViewCell()
        }
        let theGroup = groups[indexPath.row]
        let nameOfGroup = theGroup.name
        let imageOfGroup = theGroup.profileImage
        
        cell.configure(
            image: UIImage(named: imageOfGroup) ?? UIImage(),
            name: nameOfGroup)
        
        return cell
    
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer { tableView.deselectRow(
            at: indexPath,
            animated: true) }
        performSegue(
            withIdentifier: "addGroup",
            sender: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}



