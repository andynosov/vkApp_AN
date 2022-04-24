//
//  Photo-LargeVC.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 25.01.2022.
//

import UIKit

class PhotoLargeVC: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(onPan))
        view.addGestureRecognizer(recognizer)
        
        largePhoto.image = stackOfLargePhotos[selectedPhotoNumber]
    }
    
    @IBOutlet weak var largePhoto: UIImageView!
    
    var stackOfLargePhotos: [UIImage?] = []
    var selectedPhotoNumber: Int = 0
    
    
    var scrollAnimation: UIViewPropertyAnimator!
    
    @objc func onPan(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        switch recognizer.state {
            
        case .began:
            
            scrollAnimation?.startAnimation()
            scrollAnimation = UIViewPropertyAnimator(
                duration: 1.0,
                curve: .easeOut,
                animations: {
                })
            scrollAnimation.pauseAnimation()
            
            
        case .changed:
            
            self.largePhoto.transform = CGAffineTransform(translationX: translation.x, y: 0)
            
            
            
        case .ended:
            
            scrollAnimation.stopAnimation(true)
            if translation.x < -100.0 || translation.x > 100.0 { //ПРИ ДВИЖЕНИИ МЕНЬШЕ 100 СВАЙПА НЕ БУДЕТ
                
                if translation.x < 0.0 { //ПРОВЕРКА ДВИЖЕНИЯ ПАЛЬЦА: ВПРАВО ИЛИ ВЛЕВО
                    if selectedPhotoNumber < stackOfLargePhotos.count - 1 {
                        self.selectedPhotoNumber += 1
                        self.largePhoto.transform = .init(translationX: -translation.x, y: 0)
                    }
                }
                else {
                    if selectedPhotoNumber > 0 {
                        self.selectedPhotoNumber -= 1
                        self.largePhoto.transform = .init(translationX: -translation.x, y: 0)
                    }
                }
            }
            
            scrollAnimation.addAnimations {
                self.largePhoto.transform = .identity
                self.largePhoto.alpha = 1.0
            }
            scrollAnimation?.startAnimation()
            
        default: break
        }
        largePhoto.image = stackOfLargePhotos[selectedPhotoNumber]
        
    }
}


//КОГДА  МЫ ХОТИМ ВИДЕТЬ СЛЕДУЩУЮ ФОТКУ, МЫ ЛИСТАЕМ НАЗАД, ФОТКА ВОЗНИКАЕТ СПРАВА
//КОГДА  МЫ ХОТИМ ВИДЕТЬ ПРЕДЫДУЩУЮ ФОТКУ, МЫ ЛИСТАЕМ ВПЕРЕД (ВПРАВО), ФОТКА ВОЗНИКАЕТ СЛЕВА
