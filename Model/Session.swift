//
//  Session.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 14.02.2022.
//

import Foundation

class Session {
    
    private init() {}
    static let instance = Session()
    
    var token: String = ""
    var userId: Int = 0
    
}
