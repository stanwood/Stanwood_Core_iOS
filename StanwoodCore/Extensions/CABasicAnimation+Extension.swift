//
//  CABasicAnimation+Extension.swift
//  Custom Transitions
//
//  Created by Aaron Tredrea on 27/11/2018.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation

extension CABasicAnimation {
    
    public static var rotating: CABasicAnimation {
        
        let duration: Double = 10
        let animtion = CABasicAnimation(keyPath: "transform.rotation.z")
        animtion.toValue = .pi * 2.0 * duration
        animtion.duration = duration
        animtion.isCumulative = true
        animtion.repeatCount = 500000
        
        return animtion
    }
}
