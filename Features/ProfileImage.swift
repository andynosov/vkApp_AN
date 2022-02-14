//
//  Features.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 29.12.2021.
//

import UIKit

class ProfileImage: UIImageView {
    
    @IBInspectable var borderColor: UIColor = .lightGray
    @IBInspectable var borderWidth: CGFloat = 0.5
    @IBInspectable var avatarBackgroundColor: UIColor = .systemBackground
    @IBInspectable var cornerRadius: CGFloat = 45.0
    
    override func awakeFromNib() {
        self.backgroundColor = avatarBackgroundColor
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        
    
    }
}
   

class ProfileShadow: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tapOnView()
        makeShadowView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        tapOnView() // обработка нажатия на вьюху
        makeShadowView()
    }
    
    
    
    func tapOnView() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onTap))
        recognizer.numberOfTapsRequired = 1
        self.addGestureRecognizer(recognizer)
    }
    
    @objc func onTap(gestureRecognizer: UITapGestureRecognizer) {
        let original = self.transform
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.1, options: [ .autoreverse], animations: {
            self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: { _ in
            self.transform = original
        })
    }
    
    func makeShadowView(){

        frame = CGRect(x: 10, y: frame.midY-25, width: 50, height: 50)
        backgroundColor = UIColor.white
        layer.cornerRadius = 45.0
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.6
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize.zero
        
    }
}



