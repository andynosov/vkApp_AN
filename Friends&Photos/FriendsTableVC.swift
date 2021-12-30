//
//  FriendsTableViewController.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 16.12.2021.
//

import UIKit

final class FriendsTableVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(
            nibName: "FriendCell",
            bundle: nil),
                           forCellReuseIdentifier: "friendCell")
    }
    

    var friendList = [
        User(name: "Barak", profileImage: (UIImage(named: "barak")),
             profileGallery: [UIImage(named: "barak"),
                              UIImage(named: "barak"),
                              UIImage(named: "barak"),
                              UIImage(named: "barak"),
                              UIImage(named: "barak"),
                              UIImage(named: "barak")]),
        User(name: "Jessica", profileImage: (UIImage(named: "jessica")),
             profileGallery: [UIImage(named: "jessica"),
                              UIImage(named: "jessica"),
                              UIImage(named: "jessica"),
                              UIImage(named: "jessica")]),
        User(name: "Donald", profileImage: (UIImage(named: "donald")),
             profileGallery: [UIImage(named:"donald"),
                              UIImage(named:"donald"),
                              UIImage(named:"donald")])
    ]
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "friendCell",
                for: indexPath) as? FriendCell
        else {
            return UITableViewCell()
        }
        let selectedFriend = friendList[indexPath.row]
        
        cell.configure(name: selectedFriend.name, image: selectedFriend.profileImage ?? UIImage())
        
        
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
                photosFriend.title =  friendList[indexPath.row].name
                photosFriend.userPhotoCollection = friendList[indexPath.row].profileGallery //фотки пользователя
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

    
    
    
}


