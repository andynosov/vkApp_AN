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
    }
    
    //список друзей
    var friendList = [
        User(name: "barak", profileImage: (UIImage(named: "barak")),
             profileGallery: [UIImage(named: "barak"),
                              UIImage(named: "barak"),
                              UIImage(named: "barak"),
                              UIImage(named: "barak"),
                              UIImage(named: "barak"),
                              UIImage(named: "barak")]),
        User(name: "jessica", profileImage: (UIImage(named: "jessica")),
             profileGallery: [UIImage(named: "jessica"),
                              UIImage(named: "jessica"),
                              UIImage(named: "jessica"),
                              UIImage(named: "jessica")]),
        User(name: "donald", profileImage: (UIImage(named: "donald")),
             profileGallery: [UIImage(named:"donald"),
                              UIImage(named:"donald"),
                              UIImage(named:"donald")])
    ]
    
    
    var listOfFriends: [String] = []

    

    // Количество рядов = количеству друзей
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return friendList.count
    }
    
    
    // содержимое ячейки
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendTableViewCell else {return UITableViewCell()}
        cell.fieldFriendName.text = friendList[indexPath.row].name.capitalized
        cell.fieldProfileImage.image = UIImage(named: friendList[indexPath.row].name)
        return cell
    }
    
    //
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // переход
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhotoIdentifier"{
            // ссылка идентификатор перехода
            guard let photosFriend = segue.destination as? PhotoCollectionVC else { return }
            if let indexPath = tableView.indexPathForSelectedRow {
                //тайтл экрана (имя пользователя)
                photosFriend.title =  friendList[indexPath.row].name.capitalized
                photosFriend.userPhotoCollection = friendList[indexPath.row].profileGallery //фотки пользователя
            }
        }
    }
    

}


