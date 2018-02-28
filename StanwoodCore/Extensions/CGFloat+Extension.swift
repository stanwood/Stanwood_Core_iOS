//
//  CGFloat+Extension.swift
//  StanwoodCore
//
//  Created by Aaron Tredrea on 27/12/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

import Foundation

extension CGFloat {
    
    // MARK: Alpha
    
    /// Alpha of 0.0
    public static var clear: CGFloat { return 0 }
    
    /// Alpha of 0.3
    public static var veryLight: CGFloat { return 0.3 }
    
    /// Alpha of 0.4
    public static var light: CGFloat { return 0.4 }
    
    /// Alpha of 0.5
    public static var half: CGFloat { return 0.5 }
    
    /// Alpha of 0.7
    public static var faded: CGFloat { return 0.7 }
    
    /// Alpha of 1.0
    public static var full: CGFloat { return 1 }
    
    
    // MARK: Animation Damping
    
    
    /// Damping of 0.3
    public static var lowDamping: CGFloat { return 0.3 }
    
    /// Damping of 0.7
    public static var mediumDamping: CGFloat { return 0.7 }
    
    /// Damping of 1.0
    public static var highDamping: CGFloat { return 1 }
    
    
    // MARK: Animation Spring
    
    
    /// Spring of 0.3
    public static var lowSpring: CGFloat { return 0.3 }
    
    /// Spring of 0.7
    public static var mediumSpring: CGFloat { return 0.7 }
    
    /// Spring of 1.0
    public static var highSpring: CGFloat { return 1 }
    
    
    // MARK: Radius
    
    
    /// Radius of 20
    public static var largeRadius: CGFloat { return 20 }
    
    /// Radius of 15
    public static var mediumRadius: CGFloat { return 15 }
    
    /// Radius of 8
    public static var smallRadius: CGFloat { return 8 }
    
    /// Radius of 5
    public static var tinyRadius: CGFloat { return 5 }
    
}
