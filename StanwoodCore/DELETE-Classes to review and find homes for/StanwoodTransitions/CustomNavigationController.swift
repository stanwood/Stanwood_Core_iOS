//
//  CustomNavigationController.swift
//  Custom Transitions
//
//  Created by Aaron Tredrea on 16/11/2018.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController, UIViewControllerTransitioningDelegate {
    
    
    // MARK:- Properties
    
    
    var sourceView: UIView!
    var transitionType: TransitionType = .opaque
    var backgoundColour: UIColor = .white
    var transitionDuration: Double = 0.8
    var shouldClipToBounds = false
    
    
    // MARK:- LifeCycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgoundColour
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setUpControllersForCustomTransitions()
        delegate = self
    }
    
    
    // MARK:- Private Functions
    
    
    private func setUpControllersForCustomTransitions(){
        
        /// For this case we set all child controllers to the custom transition
        for controller in viewControllers{
            controller.modalPresentationStyle = .custom
            controller.transitioningDelegate = self
        }
    }

}

// MARK:- UINavigationControllerDelegate


extension CustomNavigationController: UINavigationControllerDelegate{
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        let isPresting = operation == .push
        
        return CustomAnimator(duration: transitionDuration, isPresenting: isPresting, sourceView: sourceView, transitionType: transitionType, backgoundColour: backgoundColour, shouldClipToBounds: shouldClipToBounds)
    }
}







