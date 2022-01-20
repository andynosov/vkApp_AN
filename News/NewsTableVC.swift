//
//  NewsTableVC.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 18.01.2022.
//

import Foundation
import UIKit

final class NewsTableVC: UITableViewController {
    
    var text: String = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
    
    
    var newsList = [News(name: "RBK",
                         profileImage: UIImage(named: "barak"),
                         newsText: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.",
                         newsImage: UIImage(named: "Zoya")),
                    News(name: "BBC",
                         profileImage: UIImage(named: "barak"),
                         newsText: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.",
                         newsImage: UIImage(named: "barak")),
                    News(name: "Moscow News",
                         profileImage: UIImage(named: "barak"),
                         newsText: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.",
                         newsImage: UIImage(named: "barak")),
                    News(name: "Zombie Today",
                         profileImage: UIImage(named: "zombie"),
                         newsText: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.",
                         newsImage: UIImage(named: "barak"))]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(
            nibName: "NewsCell",
            bundle: nil),
                           forCellReuseIdentifier: "newsCell")
    }
    

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsList.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "newsCell",
                for: indexPath) as? NewsCell
        else {
            return UITableViewCell()
        }
        
        
        let theNewsPost = newsList[indexPath.row]
        let profileImage = theNewsPost.profileImage
        let profileName = theNewsPost.name
        let newsImage = theNewsPost.newsImage
        let newsText = theNewsPost.newsText

        
        
        cell.configure(profileImg: profileImage ?? UIImage(),
                       profileName: profileName,
                       newsImg: newsImage ?? UIImage(),
                       newsTxt: newsText)

        
        return cell
    }
    
 
}
