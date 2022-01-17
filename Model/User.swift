//
//  User.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 19.12.2021.
//

import Foundation
import UIKit

struct User {
    var name: String
    var lastName: String
    var fullName: String {
        return name + " " + lastName
    }
    var profileImage: UIImage?
    let profileGallery: [UIImage?]
}
