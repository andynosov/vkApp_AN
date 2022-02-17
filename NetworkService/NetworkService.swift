//
//  NetworkService.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 16.02.2022.
//

import Foundation

class fetchVK{
    
    enum parametersAPI {
        case namesAndAvatars
        case photos
        case groups
        case searchGroups
    }
    

    func loadData(_ parameters: parametersAPI) {
        
      
        let configuration = URLSessionConfiguration.default
     
        let session =  URLSession(configuration: configuration)
   
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        switch parameters {
        case .namesAndAvatars:
            urlConstructor.path = "/method/friends.get"
            urlConstructor.queryItems?.append(URLQueryItem(name: "user_id", value: String(Session.instance.userId)))
            urlConstructor.queryItems?.append(URLQueryItem(name: "fields", value: "photo_50"))
        case .photos:
            urlConstructor.path = "/method/photos.getAll"
            urlConstructor.queryItems?.append(URLQueryItem(name: "owner_id", value: String(Session.instance.userId)))
        case .groups:
            urlConstructor.path = "/method/groups.get"
            urlConstructor.queryItems?.append(URLQueryItem(name: "user_id", value: String(Session.instance.userId)))
            urlConstructor.queryItems?.append(URLQueryItem(name: "extended", value: "1"))
        case .searchGroups:
            urlConstructor.path = "/method/groups.search"
            urlConstructor.queryItems?.append(URLQueryItem(name: "q", value: "video"))
            urlConstructor.queryItems?.append(URLQueryItem(name: "type", value: "group"))
        }
        
        let task = session.dataTask(with: urlConstructor.url!) { (data, response, error) in
          print("Request to API: \(urlConstructor.url!)")
            
            guard
                let data = data,
                let json = try? JSONSerialization.jsonObject(with: data)
            else {
                return
            }
            print("JSON Answer: \(String(describing: json))")
            

        }
        task.resume()
    }
    
}
