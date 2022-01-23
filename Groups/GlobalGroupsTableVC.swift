//
//  GlobalGroupsTableViewController.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 18.12.2021.
//

import UIKit

class GlobalGroupsTableVC: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBarGlobalGroups: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarGlobalGroups.delegate = self
        makeGroupList()
        tableView.register(UINib(
            nibName: "GroupCell",
            bundle: nil),
                           forCellReuseIdentifier: "groupCell")
    }
    
    
    var groups: [Group] = [
        Group(
            name: "Make America Great Again",
            profileImage: "donald"),
        Group(
            name: "SwiftUI",
            profileImage:  "coding"),
        Group(
            name: "John Lennon official",
            profileImage: "johnlennon"),
        Group(
            name: "VAZ lovers",
            profileImage:  "vaz")
    ]
    var groupsNameList: [String] = []
    var groupsNameListNew: [String] = []
    var newGroups: [Group] = []
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsNameListNew.count
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer { tableView.deselectRow(
            at: indexPath,
            animated: true)
        }
        
        
        performSegue(
            withIdentifier: "addGroup",
            sender: nil)

        
    }
    
    
    

    
    func makeGroupList() {
        groupsNameList.removeAll()
        groups.forEach { x in
            groupsNameList.append(x.name)
        }
        groupsNameListNew = groupsNameList
    }
    
    
    func generateNameForCell(_ indexPath: IndexPath) -> String {
        
        groupsNameListNew[indexPath.row]

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
    
    // МЕНЯЕМ ТУТ ТОЛЬКО СПИСОК ИМЕН! - НУЖНО ТАКЖЕ ИЗМЕНИТЬ ГРУППЫ
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        groupsNameListNew = searchText.isEmpty ? groupsNameList : groupsNameList.filter {
            (item: String) -> Bool in
            
            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        //для каждого имени в groups
        //NameListNew, если такое имя есть, пропускаем
        

        tableView.reloadData()
    }
}




