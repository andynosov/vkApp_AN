//
//  TransitionAnimationController.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 29.01.2022.
//

import UIKit

//1. Сделать анимацию переходов между экранами в UINavigationController. Появляющийся
//экран сначала находится за пределами видимости и повернут на 90 градусов, при этом его
//верхний правый угол прижат к такому же углу текущего экрана. В момент перехода
//появляющийся экран разворачивается относительно верхнего правого угла и становится на
//место текущего. Анимация закрытия должна выглядеть точно наоборот.
//2. Сделать интерактивную анимацию закрытия экрана в UINavigationController. В качестве
//распознавателя жестов использовать UIScreenEdgePanGestureRecognizer.


class TransitionAnimationController: UINavigationController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    
    func navigationController(
        _ navigationController: UINavigationController,
        animationControllerFor operation: UINavigationController.Operation,
        from fromVC: UIViewController,
        to toVC: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            self.interactiveTransition.viewController = toVC
            return TurnAnimatorPush()

        } else {
            if navigationController.viewControllers.first != toVC {
                self.interactiveTransition.viewController = toVC
            }
            return TurnAnimatorPop()
        }
    }
    
    //SWIPE
    
    let interactiveTransition = CustomInteractiveTransition()
    func navigationController(
        _ navigationController: UINavigationController,
        interactionControllerFor animationController: UIViewControllerAnimatedTransitioning
    ) -> UIViewControllerInteractiveTransitioning? {
        return interactiveTransition.hasStarted ? interactiveTransition : nil
    }
}



// BUTTON PUSH
class TurnAnimatorPush: NSObject, UIViewControllerAnimatedTransitioning {
    let duration = 0.5
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to) else { return }
        
        let containerViewFrame = transitionContext.containerView.frame

        let sourceViewFrame = CGRect(
            x: -containerViewFrame.height,
            y: 0,
            width: source.view.frame.height,
            height: source.view.frame.width
        )

        let destinationViewFrame = source.view.frame
        
        transitionContext.containerView.addSubview(destination.view)
        
        destination.view.transform = CGAffineTransform(rotationAngle: -(.pi/2))
        destination.view.frame = CGRect(
            x: containerViewFrame.height,
            y: 0,
            width: source.view.frame.height,
            height: source.view.frame.width
        )

        
            
            
            
        
        
        UIView.animate(
            withDuration: duration,
            animations: {
                source.view.transform = CGAffineTransform(rotationAngle: .pi/2)
                source.view.frame = sourceViewFrame
                destination.view.transform = .identity
                destination.view.frame = destinationViewFrame
            }) { finished in
                transitionContext.completeTransition(finished)
            }
    }
}

// BUTTON POP

class TurnAnimatorPop: NSObject, UIViewControllerAnimatedTransitioning {
    let duration = 0.5
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to) else { return }
        
        let containerViewFrame = transitionContext.containerView.frame

        let sourceViewFrame = CGRect(
            x: containerViewFrame.width,
            y: 0,
            width: source.view.frame.width,
            height: source.view.frame.height
        )

        let destinationViewFrame = source.view.frame

        transitionContext.containerView.addSubview(destination.view)
        destination.view.frame = CGRect(
            x: -containerViewFrame.height,
            y: 0,
            width: source.view.frame.width,
            height: source.view.frame.height
        )
        
        UIView.animate(
            withDuration: duration,
            animations: {
                source.view.frame = sourceViewFrame
                source.view.transform = CGAffineTransform(rotationAngle: -.pi/2)
                
                destination.view.transform = .identity
                destination.view.frame = destinationViewFrame
                
            }) { finished in
                transitionContext.completeTransition(finished)
            }
    }
}

// SWIPE TO BACK

class CustomInteractiveTransition: UIPercentDrivenInteractiveTransition {
    
    var viewController: UIViewController? {
        didSet {
            let recognizer = UIScreenEdgePanGestureRecognizer(
                target: self,
                action: #selector(handleScreenEdgeGesture))
            
            recognizer.edges = [.left]
            viewController?.view.addGestureRecognizer(recognizer)
        }
    }
    var hasStarted: Bool = false
    var shouldFinish: Bool = false
    
    @objc func handleScreenEdgeGesture(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        switch recognizer.state {
            
        case .began:
            self.hasStarted = true
            self.viewController?.navigationController?.popViewController(animated: true)
            
        case .changed:
            let translation = recognizer.translation(in: recognizer.view)
            
            let relativeTranslation = translation.y / (recognizer.view?.bounds.width ?? 1)
            let progress = max(0, min(1, relativeTranslation))
            
            self.shouldFinish = progress > 0.25
            
            self.update(progress)
            
        case .ended:
            self.hasStarted = false
            self.shouldFinish ? self.finish() : self.cancel()
            
        case .cancelled:
            
            self.hasStarted = false
            self.cancel()
            
        default: return
        }
    }
}
