//
//  TimeInterval+Extension.swift
//  StanwoodCore
//
//  Created by Aaron Tredrea on 20/11/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

import Foundation

extension TimeInterval {
    
    /// TimeInterval of 0.0
    public static var instant: TimeInterval { return 0 }
    
    /// TimeInterval of 0.001
    public static var superSmall: TimeInterval { return 0.001 }
    
    /// TimeInterval of 0.05
    public static var halfTiny: TimeInterval { return 0.05 }
    
    /// TimeInterval of 0.1
    public static var tiny: TimeInterval { return 0.1 }
    
    /// TimeInterval of 0.2
    public static var quick: TimeInterval { return 0.2 }
    
    /// TimeInterval of 0.3
    public static var normal: TimeInterval { return 0.3 }
    
    /// TimeInterval of 0.4
    public static var middle: TimeInterval { return 0.4 }
    
    /// TimeInterval of 0.5
    public static var medium: TimeInterval { return 0.5 }
    
    /// TimeInterval of 0.8
    public static var mediumSlow: TimeInterval { return 0.8 }
    
    /// TimeInterval of 1.0
    public static var slow: TimeInterval { return 1.0 }
    
    /// TimeInterval of 2.0
    public static var long: TimeInterval { return 2.0 }
    
    /// TimeInterval of 3.0
    public static var wait: TimeInterval { return 3.0 }
}
