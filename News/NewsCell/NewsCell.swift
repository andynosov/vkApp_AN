//
//  NewsCell2.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 19.01.2022.
//

import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet var profileImage: ProfileImage!
    @IBOutlet var profileNewsName: UILabel!
    @IBOutlet var newsImage: UIImageView!
    @IBOutlet var newsText: UILabel!



    func configure(profileImg: UIImage, profileName: String, newsImg: UIImage, newsTxt: String ) {
        profileImage.image = profileImg
        profileNewsName.text = profileName
        newsImage.image = newsImg
        newsText.text = newsTxt

    }
    
    
    
    
    
}
