//
//  CGAffineTransform+Extension.swift
//  Custom Transitions
//
//  Created by Aaron Tredrea on 27/11/2018.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation

extension CGAffineTransform {
    
    
    // MARK:- Properties
    
    
    /// CGAffineTransform(scaleX: 0.8, y: 0.8)
    public static var shrink: CGAffineTransform { return CGAffineTransform(scaleX: 0.8, y: 0.8) }
    
    /// CGAffineTransform(scaleX: 0.3, y: 0.3)
    public static var small: CGAffineTransform { return CGAffineTransform(scaleX: 0.3, y: 0.3) }
    
    /// CGAffineTransform(scaleX: 0.001, y: 0.001)
    public static var tiny: CGAffineTransform { return CGAffineTransform(scaleX: 0.001, y: 0.001) }
    
    
    // MARK:- Functions
    
    
    /// Combine two transforms
    static func translate(transform: CGAffineTransform, withX x: CGFloat = 0, withY y: CGFloat = 0) -> CGAffineTransform{
        
        return transform.translatedBy(x: x, y: y)
    }
}
