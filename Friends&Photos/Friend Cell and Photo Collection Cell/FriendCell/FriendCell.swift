//
//  FriendCell.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 26.12.2021.
//

import UIKit

class FriendCell: UITableViewCell {

    
    @IBOutlet var friendImage: ProfileImage!
    @IBOutlet var friendName: UILabel!
    

    
    func configure(name: String, image: UIImage) {
        friendName.text = name
        friendImage.image = image
    }
    
}
