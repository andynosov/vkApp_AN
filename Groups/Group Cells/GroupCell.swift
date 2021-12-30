//
//  GroupCell.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 25.12.2021.
//

import UIKit

final class GroupCell: UITableViewCell {


    @IBOutlet var groupImage: AvatarImage!
    @IBOutlet var groupName: UILabel!
    

    
    func configure(
        image: UIImage, //UIImage,
        name: String) {
            groupImage.image = image
            groupName.text = name
        }
    
}
