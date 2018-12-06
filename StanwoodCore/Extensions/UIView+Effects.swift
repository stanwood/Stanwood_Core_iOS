//
//  UIView+Extension.swift
//  Custom Transitions
//
//  Created by Aaron Tredrea on 27/11/2018.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation

typealias ViewCompletionBlock = () -> Void?


extension UIView {
    
    func removeAllSubViews(){
        
        subviews.forEach { (view) in
            view.removeFromSuperview()
        }
    }
    
    
    func addGradientWith(colors: [CGColor]){
        
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = colors
        layer.insertSublayer(gradient, at: 0)
    }
    
    func hideAndShrink(_ animated: Bool = false, with customDuration: TimeInterval = .normal, _ completion: ViewCompletionBlock? = nil){
        
        let duration: TimeInterval = animated ? customDuration : .instant
        
        UIView.animate(withDuration: duration, animations: {
            
            self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            self.alpha = .clear
            
        }) { (done) in
            
            completion?()
        }
    }
    
    func expandAndShow(_ animated: Bool = true, with customDuration: TimeInterval = .normal, _ completion: ViewCompletionBlock? = nil){
        
        let duration: TimeInterval = animated ? customDuration : .instant
        
        UIView.animate(withDuration: duration, animations: {
            
            self.transform = CGAffineTransform.identity
            self.alpha = .full
            
        }) { (done) in
            
            completion?()
        }
    }
    
    func rotate(_ rotate: Bool){
        
        if rotate {
            layer.removeAllAnimations()
            layer.add(CABasicAnimation.rotating, forKey: "rotationAnimation")
        }else{
            layer.removeAllAnimations()
        }
        
    }
    
    func removeShadow(){
        layer.shadowRadius = 0
        layer.shadowOpacity = 0
    }
}
