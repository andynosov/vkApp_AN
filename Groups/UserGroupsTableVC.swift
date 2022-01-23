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
                !groups.contains(globalGroupsVC.groups[groupIndexPath.row]),
                !groupsNameList.contains(globalGroupsVC.groupsNameListNew[groupIndexPath.row])
            else {
                return
            }
        globalGroupsVC.groups.forEach{ x in
            if x.name == globalGroupsVC.groupsNameListNew[groupIndexPath.row]  {
                groups.append(x)
                makeGroupList()
            }
        }
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
    var groupsNameListNew: [String] = []
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groupsNameListNew.count

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupCell
        else {
            return UITableViewCell()
        }
        
        cell.groupName.text = generateNameForCell(indexPath)
        cell.groupImage.image = generateProfileImageForCell(indexPath)
        
        return cell
    
    }
    
    func makeGroupList() {
        groupsNameList.removeAll()
        groups.forEach { x in
            groupsNameList.append(x.name)
        }
        groupsNameListNew = groupsNameList
        tableView.reloadData()
    }
    
    
    func generateNameForCell(_ indexPath: IndexPath) -> String {
        return groupsNameListNew[indexPath.row]
    }
    
    func generateProfileImageForCell(_ indexPath: IndexPath) -> UIImage? {
        for x in groups {
            let namesRows = generateNameForCell(indexPath)
            if x.name.contains(namesRows) {
                return UIImage(named: x.profileImage)
            }
        }
        return nil
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
            groups.forEach{ x in
                if x.name == groupsNameListNew[indexPath.row] {
                    groups.remove(at: indexPath.row)
                }
            }
        }
        makeGroupList()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        
        groupsNameListNew = searchText.isEmpty ? groupsNameList : groupsNameList.filter {
            (item: String) -> Bool in
            return item.range(of: searchText,
                              options: .caseInsensitive,
                              range: nil,
                              locale: nil) != nil
        }
       
        tableView.reloadData()
    }
    
    
}


