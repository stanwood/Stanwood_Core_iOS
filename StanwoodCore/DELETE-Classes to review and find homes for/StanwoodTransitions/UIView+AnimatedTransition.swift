//
//  UIView+AnimatedTransition.swift
//  Custom Transitions
//
//  Created by Aaron Tredrea on 16/11/2018.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    
    /// Use this to set the id of views.
    @IBInspectable
    var transitionID: String {
        get {
            return self.restorationIdentifier ?? ""
        }
        set {
            /// Not sure hacking this is the wisest move but we need a string property on all views without making a sublcass. And this is better than a tag for now :D 
            self.restorationIdentifier = newValue
        }
    }
    
    /// Grab all subviews with a custom tag
    func viewWithID(_ id: String) -> UIView? {
        let selectedView = subViewsWithTransitionID.filter { $0.transitionID == id}.first
        return selectedView 
    }
    
    /// Property to grab all views with transitionIDS from source view
    var subViewsWithTransitionID: [UIView] {
        return UIView.getAllSubviewsWithTransitionIDSFrom(self)
    }
    
    /// Grab all subviews with a custom ID
    static func getAllSubviewsWithTransitionIDSFrom(_ view: UIView) -> [UIView] {
        return view.subviews.flatMap { subView -> [UIView] in
            var result = getAllSubviewsWithTransitionIDSFrom(subView) as [UIView]
            let view = subView as UIView
            if  !view.transitionID.isEmpty {
                result.append(view)
            }
            return result
        }
    }
    
    /// Create all bundles
    static func createAnimationBundleFrom(_ views: [UIView], with detailView: UIView, and isPresenting: Bool, from fromView: UIView, transitionType: TransitionType, shouldClipToBounds: Bool) -> [ViewAnimationBundle] {
        
        var viewAnimationBundles = [ViewAnimationBundle]()
        
        views.forEach { (view) in
            
            if let animationBundle = createViewBundle(with: detailView, from: view, and: isPresenting, from: fromView, transitionType: transitionType, shouldClipToBounds: shouldClipToBounds){
                viewAnimationBundles.append(animationBundle)
            }
        }
        
        return viewAnimationBundles
    }
    
    static func createViewBundle(with destinationView: UIView, from orignalView: UIView, and isPresenting: Bool, from fromView: UIView, transitionType: TransitionType, shouldClipToBounds: Bool) -> ViewAnimationBundle? {
        
        guard
            let destination = destinationView.viewWithID(orignalView.transitionID),
            let mainWindow = UIApplication.shared.keyWindow
            else {
                return nil
                
        }
        
        destination.clipsToBounds = true
        
        /// Create to and from Views
        let newImageViewFrame = mainWindow.convert(destination.frame, from: fromView)
        let originalImageViewFrame = mainWindow.convert(orignalView.frame, from: orignalView.superview)
        
        /// Create temporary view to animate
        let animatingImageView = UIImageView(frame: isPresenting ? originalImageViewFrame : newImageViewFrame)
        
        
        /// Image view get a real image in an image view so it animates changes better tan a snapshot
        /// TODO:- Do the same to support blurs
        if let imageView = orignalView as? UIImageView {
            
            animatingImageView.image = imageView.image
            animatingImageView.contentMode = .scaleAspectFill
            animatingImageView.clipsToBounds = true
            let detailImageView = destination as? UIImageView
            detailImageView?.image = imageView.image
            
        }else{
            
            animatingImageView.image = orignalView.asImage
            animatingImageView.contentMode = .scaleAspectFill
            animatingImageView.clipsToBounds = shouldClipToBounds
        }
        
        let destinationCopyView = UIImageView(frame: isPresenting ? originalImageViewFrame : newImageViewFrame)
        destinationCopyView.image = destination.asImage
        destinationCopyView.contentMode = .scaleAspectFill
        destinationCopyView.clipsToBounds = shouldClipToBounds
        
        /// Set radius if we need to chnange it
        animatingImageView.layer.cornerRadius = isPresenting ? orignalView.layer.cornerRadius : destination.layer.cornerRadius
        animatingImageView.layoutIfNeeded()
        
        return ViewAnimationBundle(animatingView: animatingImageView, orignalView: orignalView, destinationView: destination ,destinationViewCopy: destinationCopyView, newFrame: newImageViewFrame, originalFrame: originalImageViewFrame, transitionType: transitionType, index: 0)
    }
    
    var asImage: UIImage? {
        
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(bounds: bounds)
            return renderer.image { rendererContext in
                layer.render(in: rendererContext.cgContext)
            }
        } else {
            
            UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0.0)
            defer { UIGraphicsEndImageContext() }
            guard let currentContext = UIGraphicsGetCurrentContext() else {
                return nil
            }
            self.layer.render(in: currentContext)
            return UIGraphicsGetImageFromCurrentImageContext()
        }
    }
    
    
}




