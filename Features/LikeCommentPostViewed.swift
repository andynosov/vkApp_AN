//
//  LikeCommentPostViewed.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 20.01.2022.
//

import UIKit

class Like: UIControl {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configView()
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configView()
    }
    
    
    var countLikes = 0
    var liked = false
    let likeImage = UIImageView(image: UIImage(systemName: "heart"))
    let likeCount = UILabel(frame: CGRect(x: 25.0, y: 0.0, width: 100.0, height: 20.0))
//25 -шаг от сердечка
    
    private func configView() {

        self.addSubview(likeImage)
        self.addSubview(likeCount)
        self.tintColor = UIColor.lightGray
        self.backgroundColor = .clear
        //self.layer.cornerRadius = 10.0
        likeCount.text = String(countLikes)
        
    }
    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        if liked {
            liked = false
            countLikes -= 1
            likeImage.image =  UIImage(systemName: "heart")
            likeCount.textColor = .darkGray
            likeImage.tintColor = .darkGray
        } else {
            liked = true
            countLikes += 1
            likeImage.image =  UIImage(systemName: "heart.fill")
            likeCount.textColor = .systemPink
            likeImage.tintColor = .systemPink
        }
        likeCount.text = String(countLikes)
        return false
    }

}


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
    let commentCount = UILabel(frame: CGRect(x: 25.0, y: 0.0, width: 100.0, height: 20.0))
//25 -шаг от сердечка
    
    private func configView() {

        self.addSubview(commentImage)
        self.addSubview(commentCount)
        self.tintColor = UIColor.lightGray
        self.backgroundColor = .clear
        //self.layer.cornerRadius = 10.0
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
    let commentCount = UILabel(frame: CGRect(x: 25.0, y: 0.0, width: 100.0, height: 20.0))
//25 -шаг от сердечка
    
    private func configView() {

        self.addSubview(commentImage)
        self.addSubview(commentCount)
        self.tintColor = UIColor.lightGray
        self.backgroundColor = .clear
        //self.layer.cornerRadius = 10.0
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
    let commentImage = UIImageView(image: UIImage(systemName: "eye.fill"))
    let commentCount = UILabel(frame: CGRect(x: 30.0, y: 0.0, width: 100.0, height: 20.0))
//25 -шаг от сердечка
    
    private func configView() {

        self.addSubview(commentImage)
        self.addSubview(commentCount)
        self.tintColor = UIColor.lightGray
        self.backgroundColor = .clear
        //self.layer.cornerRadius = 10.0
        commentCount.text = String(countComments)
        
    }

}

