//
//  Likes.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 29.12.2021.
//

import UIKit

class LikeFeature: UIControl {
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
    let likeCount = UILabel(frame: CGRect(x: 25, y: 0, width: 40, height: 20))
    @IBInspectable var backgroundColorInspectable: UIColor = .clear
    
    
    private func configView() {

        self.addSubview(likeImage)
        self.addSubview(likeCount)
        self.tintColor = UIColor.lightGray
        self.tintColor = UIColor.lightGray
        likeCount.textColor = UIColor.lightGray
        self.backgroundColor = backgroundColorInspectable
        likeCount.text = String(countLikes)
        
    }
    
    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        let original = self.likeImage.transform
        UIView.animate(withDuration: 0.2, delay: 0, options: [ .autoreverse], animations: {
 
            self.likeImage.transform = CGAffineTransform(scaleX: 2, y: 2)
        }, completion: { _ in
            self.likeImage.transform = original

        })
        
        if liked {
            liked = false
            countLikes -= 1
            likeImage.image =  UIImage(systemName: "heart")
            likeCount.textColor = .lightGray
            likeImage.tintColor = .lightGray
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

