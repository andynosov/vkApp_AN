//
//  LikeCommentPostViewed.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 20.01.2022.
//

import UIKit




class Comment: UIControl {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configView()
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configView()
    }
    
    
    var countComments = 0
    let commentImage = UIImageView(image: UIImage(systemName: "bubble.right"))
    let commentCount = UILabel(frame: CGRect(x: 30.0, y: 0.0, width: 50.0, height: 20.0))
//25 -шаг от сердечка
    
    private func configView() {

        self.addSubview(commentImage)
        self.addSubview(commentCount)
        self.tintColor = UIColor.lightGray
        commentCount.textColor = UIColor.lightGray
        self.backgroundColor = .clear
        commentCount.text = String(countComments)
        
    }

}


class Repost: UIControl {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configView()
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configView()
    }
    
    
    var countComments = 0
    let commentImage = UIImageView(image: UIImage(systemName: "arrowshape.turn.up.forward"))
    let commentCount = UILabel(frame: CGRect(x: 30.0, y: 0.0, width: 50.0, height: 20.0))
//25 -шаг от сердечка
    
    private func configView() {

        self.addSubview(commentImage)
        self.addSubview(commentCount)
        self.tintColor = UIColor.lightGray
        self.backgroundColor = .clear
        commentCount.textColor = UIColor.lightGray
        commentCount.text = String(countComments)
        
    }

}

class Viewed: UIControl {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configView()
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configView()
    }
    
    
    var countComments = 0
    let commentImage = UIImageView(image: UIImage(systemName: "eye"))
    let commentCount = UILabel(frame: CGRect(x: 30.0, y: 0.0, width: 50.0, height: 20.0))
//25 -шаг от сердечка
    
    private func configView() {

        self.addSubview(commentImage)
        self.addSubview(commentCount)
        self.tintColor = UIColor.lightGray
        self.backgroundColor = .clear
        commentCount.textColor = UIColor.lightGray
        commentCount.text = String(countComments)
        
    }

}

