//
//  UIView+Dismiss.swift
//  Custom Transitions
//
//  Created by Aaron Tredrea on 27/11/2018.
//  Copyright © 2018 Stanwood GmbH. All rights reserved.
//

import Foundation


@objc protocol DismissView {
    
    func dismiss()
    @objc optional func dismissViewAnimating()
    @objc optional func dismissViewCompleted()
}

extension DismissView where Self: UIView  {
    
    func dismiss(with duration: TimeInterval, shouldDismissSelf dismiss: Bool = true){
        
        UIView.animate(withDuration: duration, animations: {
            
            self.dismissViewAnimating?()
            
            self.alpha = .clear
            self.transform = .shrink
            self.layoutIfNeeded()
            
        }) { (complete) in
            
            if dismiss {
                
                self.removeFromSuperview()
            }
            
            self.dismissViewCompleted?()
        }
    }
}
