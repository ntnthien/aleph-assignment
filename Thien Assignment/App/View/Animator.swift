//
//  Animator.swift
//  Thien Assignment
//

import UIKit

class AnimationUtility: UIViewController, CAAnimationDelegate {
    
    static let kSlideAnimationDuration: CFTimeInterval = 0.6
    
    static func viewSlideInFromRight(toLeft views: UIView) {
        var transition: CATransition? = nil
        transition = CATransition.init()
        transition?.duration = kSlideAnimationDuration
        transition?.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition?.type = kCATransitionPush
        transition?.subtype = kCATransitionFromRight
        views.layer.add(transition!, forKey: nil)
    }
    
    static func viewSlideInFromLeft(toRight views: UIView) {
        var transition: CATransition? = nil
        transition = CATransition.init()
        transition?.duration = kSlideAnimationDuration
        transition?.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition?.type = kCATransitionPush
        transition?.subtype = kCATransitionFromLeft
        views.layer.add(transition!, forKey: nil)
    }
    
    static func viewSlideInFromTop(toBottom views: UIView) {
        var transition: CATransition? = nil
        transition = CATransition.init()
        transition?.duration = kSlideAnimationDuration
        transition?.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition?.type = kCATransitionPush
        transition?.subtype = kCATransitionFromBottom
        views.layer.add(transition!, forKey: nil)
    }
    
    static func viewSlideInFromBottom(toTop views: UIView) {
        var transition: CATransition? = nil
        transition = CATransition.init()
        transition?.duration = kSlideAnimationDuration
        transition?.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition?.type = kCATransitionPush
        transition?.subtype = kCATransitionFromTop
        views.layer.add(transition!, forKey: nil)
    }
}
