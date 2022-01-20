//
//  UserGroupsTableViewController.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 16.12.2021.
//

import UIKit

class UserGroupsTableVC: UITableViewController, UISearchBarDelegate {
    

    
    @IBOutlet weak var searchBarUserGroups: UISearchBar!
    @IBAction func toGlobalGroups(segue: UIStoryboardSegue){
            guard
                segue.identifier == "addGroup",
                let globalGroupsVC = segue.source as? GlobalGroupsTableVC,
                let groupIndexPath = globalGroupsVC.tableView.indexPathForSelectedRow,
                !self.groups.contains(globalGroupsVC.groups[groupIndexPath.row])
            else {
                return
            }
            self.groups.append(globalGroupsVC.groups[groupIndexPath.row])
            tableView.reloadData()
            print("one")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarUserGroups.delegate = self
        makeGroupList()
        tableView.register(UINib(
            nibName: "GroupCell",
            bundle: nil),
                           forCellReuseIdentifier: "groupCell")
    }
    
    var groups: [Group] = []
    var groupsNameList: [String] = []

    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "groupCell",
                for: indexPath) as? GroupCell
        else {
            return UITableViewCell()
            
        }
        let theGroup = groups[indexPath.row]
        let avatarOfGroup = theGroup.profileImage
        let nameOfGroup = theGroup.name
        
        cell.configure(
            image: UIImage(named: avatarOfGroup) ?? UIImage(),
            name: nameOfGroup)

        
        return cell
    }
    
    
    
    
    
  override func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(
                at: indexPath,
                animated: true)
        }

    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

    func makeGroupList() {
        groupsNameList.removeAll()
        groups.forEach { x in
            groupsNameList.append(x.name)
        }
    
    }
    
    
    

    
}


