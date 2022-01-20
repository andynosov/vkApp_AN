//
//  FriendsTableViewController.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 16.12.2021.
//

import UIKit

final class FriendsTableVC: UITableViewController {
    
    var friendList = [
        User(name: "Barak",
             lastName: "Obama",
             profileImage: (UIImage(named: "barak")),
             profileGallery: [UIImage(named: "barak"),
                              UIImage(named: "barak"),
                              UIImage(named: "barak"),
                              UIImage(named: "barak"),
                              UIImage(named: "barak"),
                              UIImage(named: "barak")]),
        User(name: "Jessica",
             lastName: "Jones",
             profileImage: (UIImage(named: "jessica")),
             profileGallery: [UIImage(named: "jessica"),
                              UIImage(named: "jessica"),
                              UIImage(named: "jessica"),
                              UIImage(named: "jessica")]),
        User(name: "Donald",
             lastName: "Trump",
             profileImage: (UIImage(named: "donald")),
             profileGallery: [UIImage(named:"donald"),
                              UIImage(named:"donald"),
                              UIImage(named:"donald")]),
        User(name: "Donny",
             lastName: "Abrakham",
             profileImage: (UIImage(named: "donny")),
             profileGallery: [UIImage(named:"donny"),
                              UIImage(named:"donny"),
                              UIImage(named:"donny")]),
        User(name: "Zombie",
             lastName: "ZooBee",
             profileImage: (UIImage(named: "zombie")),
             profileGallery: [UIImage(named:"zombie"),
                              UIImage(named:"zombie"),
                              UIImage(named:"zombie")])
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(
            nibName: "FriendCell",
            bundle: nil),
                           forCellReuseIdentifier: "friendCell")
        
        createFriendNamesList()
        createFirstLettersList()
        
    }
    
    var fullNamesList: [String] = [] //список имен
    var listOfFirstLetters: [String] = []
    var listFirstNames: [String] = []
    var listLastNames: [String] = []
    var nameDict:[String: String] = [:]

    
    func createFriendNamesList() {
        friendList.forEach{ x in
            fullNamesList.append(x.fullName)
            listFirstNames.append(x.name)
            listLastNames.append(x.lastName)
        }
        nameDict = Dictionary(uniqueKeysWithValues: zip(listFirstNames, listLastNames))
    }
 

    func createFirstLettersList(){
        nameDict.values.forEach{ x in
            listOfFirstLetters.append(String(x.prefix(1)))
        }
        let newSet = Set(listOfFirstLetters).sorted()
            listOfFirstLetters = Array(newSet)
    }
    
    
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return listOfFirstLetters.count
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return listOfFirstLetters
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowsQty: Int = 0
        nameDict.forEach { x in
            if listOfFirstLetters[section].contains(x.value.first!){
                rowsQty += 1
            }
        }
        return rowsQty
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = .systemGray.withAlphaComponent(0.2)
        let letterInHeader = UILabel(frame: CGRect(x: 30, y: 5, width: 20, height: 20))
        letterInHeader.textColor = UIColor.gray
        letterInHeader.text = listOfFirstLetters[section]
        header.addSubview(letterInHeader)
        
        return header
    }
    
    func fullFriendNameForCell(_ indexPath: IndexPath) -> String {
        var namesRows = [String]()
        nameDict.forEach { x in
            if listOfFirstLetters[indexPath.section].contains(x.value.prefix(1)){
                let fullName = x.key + " " +  x.value
                namesRows.append(fullName)
            }
        }
        return namesRows[indexPath.row]
    }
    
    
    func friendNameForCell(_ indexPath: IndexPath) -> String {
        var namesRows = [String]()
        friendList.forEach { x in
            if listOfFirstLetters[indexPath.section].contains(x.lastName.prefix(1)) {
                namesRows.append(x.name)
            }
        }
        return namesRows[indexPath.row]
    }
    
    
    func friendImageForCell(_ indexPath: IndexPath) -> UIImage? {
        for friend in friendList {
            let namesRows = friendNameForCell(indexPath)
            if friend.name.contains(namesRows) {
                return friend.profileImage
            }
        }
        return nil
    }
    
    
    
    func friendProfileGalleryForCell(_ indexPath: IndexPath) -> [UIImage?] {
        var photos = [UIImage?]()
        friendList.forEach { x in
            let namesRows = friendNameForCell(indexPath)
            if x.name.contains(namesRows) {
                photos.append(contentsOf: x.profileGallery)
            }
        }
        return photos
    }
    
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "friendCell",
                for: indexPath) as? FriendCell
        else {
            return UITableViewCell()
        }
        
        cell.friendName.text = fullFriendNameForCell(indexPath)
        cell.friendImage.image = friendImageForCell(indexPath)
        
        return cell
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer { tableView.deselectRow(
            at: indexPath,
            animated: true) }
        performSegue(
            withIdentifier: "showFriendPhotos",
            sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFriendPhotos"{
            // ссылка идентификатор перехода
            guard let photosFriend = segue.destination as? PhotoCollectionVC else { return }
            if let indexPath = tableView.indexPathForSelectedRow {
                //тайтл экрана (имя пользователя)
                photosFriend.title =  fullFriendNameForCell(indexPath)
                photosFriend.userPhotoCollection = friendProfileGalleryForCell(indexPath) //фотки пользователя
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    
    
    
}


