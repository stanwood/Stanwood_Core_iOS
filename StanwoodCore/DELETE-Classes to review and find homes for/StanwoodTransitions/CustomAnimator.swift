//
//  CustomAnimator.swift
//  Custom Transitions
//
//  Created by Aaron Tredrea on 16/11/2018.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import UIKit

class CustomAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    // MARK:- Properties
    
    
    var duration : TimeInterval
    var isPresenting : Bool
    var sourceView : UIView?
    var transitionType: TransitionType
    var backgoundColour: UIColor
    var shouldClipToBounds : Bool
    
    
    // MARK:- Init
    
    
    init(duration: TimeInterval, isPresenting: Bool, sourceView: UIView?, transitionType: TransitionType = .opaque, backgoundColour: UIColor = .white, shouldClipToBounds: Bool) {
        self.duration = duration
        self.isPresenting = isPresenting
        self.sourceView = sourceView
        self.transitionType = transitionType
        self.backgoundColour = backgoundColour
        self.shouldClipToBounds = shouldClipToBounds
    }

    
    // MARK:- UIViewControllerAnimatedTransitioning
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let container = transitionContext.containerView
        
        /// Main Frames
        guard let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) else { return }
        guard let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
        
        toView.backgroundColor = backgoundColour
        fromView.backgroundColor = backgoundColour
        container.backgroundColor = backgoundColour
        
        /// Add container to hold our animating views
        self.isPresenting ? container.addSubview(toView) : container.insertSubview(toView, belowSubview: fromView)
        
        /// Get instance of where we are animating to so we can grab any view instances
        let detailView = isPresenting ? toView : fromView
        
        /// Set size and Alpha
        toView.frame = isPresenting ?  CGRect(x: fromView.frame.width, y: 0, width: toView.frame.width, height: toView.frame.height) : toView.frame
        
        toView.layoutIfNeeded()
        
        /// Loop through all views to grab the views with custom tags
        guard let animatingViews = sourceView?.subViewsWithTransitionID else {
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            return
        }
        
        /// Create bundles for each view we want to animate
        let bundles = UIView.createAnimationBundleFrom(animatingViews, with: detailView, and: isPresenting, from: fromView, transitionType: transitionType, shouldClipToBounds: shouldClipToBounds)
        
        /// Add the view we will animate, but hide the one we animate from and to
        bundles.forEach { (bundle) in
            
            container.addSubview(bundle.animatingView)
            bundle.destinationView.alpha = 0
            bundle.orignalView.alpha = 0
            
            if bundle.transitionType == .fade {
                bundle.destinationViewCopy.alpha = self.isPresenting ? 0 : 1
                container.addSubview(bundle.destinationViewCopy)
                detailView.frame = fromView.frame
                toView.alpha = 0
            }
        }
        
        fromView.layoutIfNeeded()
        toView.layoutIfNeeded()
        container.layoutIfNeeded()
        
        UIView.animate(withDuration: duration, animations: {
            
            /// Animate to the new frames
            bundles.forEach { (bundle) in
                
                bundle.animatingView.frame = self.isPresenting ? bundle.newFrame : bundle.originalFrame
                bundle.animatingView.layer.cornerRadius = self.isPresenting ? bundle.destinationView.layer.cornerRadius : bundle.orignalView.layer.cornerRadius
                
                if bundle.transitionType == .fade {
                    bundle.animatingView.alpha = 0
                    bundle.destinationViewCopy.frame = bundle.animatingView.frame
                    bundle.destinationViewCopy.alpha = self.isPresenting ? 1 : 0
                    bundle.destinationViewCopy.layer.cornerRadius = bundle.animatingView.layer.cornerRadius
                    
                    toView.alpha = 1
                }
                
                
                if !self.isPresenting, bundle.transitionType == .fade {
                    bundle.animatingView.alpha = 1
                }
                
                fromView.alpha = 0
            }
            
            detailView.frame = self.isPresenting ? fromView.frame : toView.frame
            
            fromView.layoutIfNeeded()
            toView.layoutIfNeeded()
            container.layoutIfNeeded()
            detailView.layoutIfNeeded()
            
        }, completion: { (finished) in
            
            /// When we have finished, we remove the views we animated and add then orginals back
            bundles.forEach { (bundle) in
                bundle.animatingView.alpha = 1
                bundle.orignalView.alpha = 1
                bundle.animatingView.removeFromSuperview()
                bundle.destinationViewCopy.removeFromSuperview()
                bundle.destinationView.alpha = 1
            }
            
            detailView.alpha = 1
            toView.alpha = 1
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
    
}

