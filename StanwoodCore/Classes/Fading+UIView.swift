//
//  Fading+UIView.swift
//  StanwoodCore
//
//  Created by Tal Zion on 27/12/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

import Foundation

/**
 Fading protocol animates view in and out
 */
public protocol Fading where Self: UIView {
    
    /**
     Fade in Self with animation
     
     - Parameter:
        - animated: add animation
        - duration: animation duration
     */
    func fadeIn(animated: Bool, duration: Double)
    
    /**
     Fade out Self with animation
     
     - Parameter:
        - animated: add animation
        - duration: animation duration
     */
    func fadeOut(animated: Bool, duration: Double)
}

extension Fading {
    
    /**
     Fade in Self with animation
     
     - Parameter:
        - animated: add animation
        - duration: animation duration
     */
    public func fadeIn(animated: Bool = true, duration: Double = 0.5) {
        if animated {
            UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseOut, animations: {
                self.alpha = 1.0
            }, completion: nil)
        } else {
            alpha = 1.0
        }
    }
    
    /**
     Fade out Self with animation
     
     - Parameter:
        - animated: add animation
        - duration: animation duration
     */
    public func fadeOut(animated: Bool = true, duration: Double = 0.5) {
        if animated {
            UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseOut, animations: {
                self.alpha = 0.0
            }, completion: nil)
        } else {
            alpha = 0.0
        }
    }
}
