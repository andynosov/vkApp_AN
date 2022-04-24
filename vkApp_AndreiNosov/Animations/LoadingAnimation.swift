//
//  LoadingAnimation.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 21.01.2022.
//

import UIKit

class LoadingAnimation: UIView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        startLoadingAnimationView()
    }
    
    // инициализация при использовании в storyboard
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        startLoadingAnimationView()
    }

let circle1: UIView = UIView(frame: CGRect(x: 50, y: 10, width: 20, height: 20))
let circle2: UIView = UIView(frame: CGRect(x: 90, y: 10, width: 20, height: 20))
let circle3: UIView = UIView(frame: CGRect(x: 130, y: 10, width: 20, height: 20))
    
    
    
    
    func startLoadingAnimationView(){

        
        circle1.backgroundColor = .systemBlue
        circle1.layer.cornerRadius = self.circle1.frame.width / 2
        circle2.backgroundColor = .systemBlue
        circle2.layer.cornerRadius = self.circle2.frame.width / 2
        circle3.backgroundColor = .systemBlue
        circle3.layer.cornerRadius = self.circle3.frame.width / 2
    
        
        UIView.animate(withDuration: 0.6, delay: 0.0, options: [.repeat, .autoreverse], animations: {self.circle1.alpha = 0})
        UIView.animate(withDuration: 0.6, delay: 0.2, options: [.repeat, .autoreverse], animations: {self.circle2.alpha = 0})
        UIView.animate(withDuration: 0.6, delay: 0.4, options: [.repeat, .autoreverse], animations: {self.circle3.alpha = 0})

        self.addSubview(circle1)
        self.addSubview(circle2)
        self.addSubview(circle3)
    }
}
