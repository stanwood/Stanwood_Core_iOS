//
//  StanwoodViewController.swift
//  Custom Transitions
//
//  Created by Aaron Tredrea on 17/11/2018.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import UIKit

class StanwoodViewController: UIViewController {
    
    
    // MARK:- Properties
    
    
    var transitionType: TransitionType = .opaque
    var transitionDuration: Double = 0.8
    var backgroundColour: UIColor = .white
    var shouldClipToBounds = false
}




// MARK:- UIViewControllerTransitioningDelegate


extension StanwoodViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return CustomAnimator(duration: transitionDuration, isPresenting: true, sourceView: view, transitionType: transitionType, backgoundColour: backgroundColour, shouldClipToBounds: shouldClipToBounds)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomAnimator(duration: transitionDuration, isPresenting: false, sourceView: view, transitionType: transitionType, backgoundColour: backgroundColour, shouldClipToBounds: shouldClipToBounds)
    }
}


