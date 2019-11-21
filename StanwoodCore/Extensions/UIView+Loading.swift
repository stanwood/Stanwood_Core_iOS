//
//  UIView+Loading.swift
//  Custom Transitions
//
//  Created by Aaron Tredrea on 27/11/2018.
//  Copyright © 2018 Stanwood GmbH. All rights reserved.
//

import Foundation

@objc protocol PresentView {
    
    func present()
    @objc optional func presentViewAnimating()
    @objc optional func presentViewCompleted()
}

extension PresentView where Self: UIView  {
    
    func present(with duration: TimeInterval){
        
        alpha = .clear
        transform = .shrink
        layoutIfNeeded()
        
        UIView.animate(withDuration: duration, animations: {
            
            self.presentViewAnimating?()
            
            self.alpha = .full
            self.transform = CGAffineTransform.identity
            self.layoutIfNeeded()
            
        }) { (complete) in
            
            self.presentViewCompleted?()
        }
    }
}
