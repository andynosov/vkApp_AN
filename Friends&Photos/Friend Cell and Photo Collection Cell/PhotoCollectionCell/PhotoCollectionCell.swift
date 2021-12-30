//
//  PhotoCollectionCell.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 26.12.2021.
//

import UIKit

class PhotoCollectionCell: UICollectionViewCell {

    @IBOutlet weak var friendLargePhoto: UIImageView!
    
    func configure(image: UIImage) {
        friendLargePhoto.image = image
    }
}
