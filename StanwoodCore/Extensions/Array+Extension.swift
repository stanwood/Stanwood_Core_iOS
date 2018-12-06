//
//  Extension+Array.swift
//  Custom Transitions
//
//  Created by Aaron Tredrea on 27/11/2018.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation


extension Array {
    
    var uniqueItems: Array {
        return NSSet(array: self).allObjects as? Array ?? self
    }
}

extension Array where Element: UIView {
    
    func hideWithCascade(withDelay delay:TimeInterval = .instant, withAnimationtime animationTime:TimeInterval = .instant, withOffset offset: CGFloat = 10){
        
        for item in self{
            
            let delay = (TimeInterval((self.index(of: item)) ?? 0) * delay) + delay
            
            let indexAsFloat = CGFloat(self.index(of: item) ?? 0)
            let newOffset = (indexAsFloat * offset) + offset
            
            UIView.animate(withDuration: animationTime, delay: delay, usingSpringWithDamping: .highDamping, initialSpringVelocity: .mediumSpring, options: [.allowAnimatedContent, .allowUserInteraction], animations: {
                
                item.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8).translatedBy(x: 0, y: newOffset)
                item.alpha = .clear
                
                item.layoutIfNeeded()
                
            }, completion: nil)
        }
    }
    
    func showWithCascade(withDelay delay:TimeInterval = .halfTiny, withAnimationtime animationTime:TimeInterval = .medium, withOffset offset: CGFloat = 10){
        
        for item in self{
            
            let indexAsDouble = Double(index(of: item) ?? 0)
            
            let delay = (indexAsDouble * delay) + delay
            
            UIView.animate(withDuration: animationTime, delay: delay, usingSpringWithDamping: .highDamping, initialSpringVelocity: .mediumSpring, options: [.allowAnimatedContent, .allowUserInteraction], animations: {
                
                item.transform = CGAffineTransform.identity
                item.alpha = .full
                
                item.layoutIfNeeded()
                
            }, completion: nil)
        }
    }
    
    func setViewsHidden(_ hidden: Bool){
        
        let alpha: CGFloat = hidden ? .clear : .full
        let transfom: CGAffineTransform = hidden ? .shrink : .identity
        let delay: TimeInterval = hidden ? .instant : .medium
        UIView.animate(withDuration: .normal, delay: delay, options: .allowAnimatedContent, animations: {
            
            self.forEach { (item) in
                item.alpha = alpha
                item.transform = transfom
                item.layoutIfNeeded()
            }
            
        }, completion: { (done) in
            
            self.forEach { (item) in
                item.transform = .identity
                item.layoutIfNeeded()
            }
        })
    }
}
