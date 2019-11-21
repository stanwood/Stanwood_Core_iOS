//
//  CGRect+Extension.swift
//  Custom Transitions
//
//  Created by Aaron Tredrea on 27/11/2018.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation


extension CGRect {
    
    var width: CGFloat{
        return size.width
    }
    
    var height: CGFloat{
        return size.height
    }
    
    var halfWidth: CGFloat{
        return width / 2
    }
    
    var halfHeight: CGFloat{
        return height / 2
    }
}
