//
//  GroupVK.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 19.12.2021.
//

import Foundation
import UIKit


struct Group: Equatable {
    var name: String
    var profileImage: String
    
    
    static func ==(lhs: Group, rhs: Group) -> Bool {
        return lhs.name == rhs.name
    }
}
