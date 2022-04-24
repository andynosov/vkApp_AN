//
//  GroupCell.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 25.12.2021.
//

import UIKit

final class GroupCell: UITableViewCell {


    @IBOutlet var groupImage: ProfileImage!
    @IBOutlet var groupName: UILabel!
    

    
    func configure(image: UIImage, name: String) {
            groupImage.image = image
            groupName.text = name
        }
    
}
