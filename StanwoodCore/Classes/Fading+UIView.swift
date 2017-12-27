//
//  Fading+UIView.swift
//  StanwoodCore
//
//  Created by Tal Zion on 27/12/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

import Foundation

public protocol Fading where Self: UIView {
    func fadeIn(animated: Bool, duration: Double)
    func fadeOut(animated: Bool, duration: Double)
}

extension Fading {
    
    
    public func fadeIn(animated: Bool = true, duration: Double = 0.5) {
        if animated {
            UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseOut, animations: {
                self.alpha = 1.0
            }, completion: nil)
        } else {
            alpha = 1.0
        }
    }
    
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
