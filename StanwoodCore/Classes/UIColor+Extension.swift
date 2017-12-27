//
//  UIColor+Extension.swift
//  StanwoodCore
//
//  Created by Tal Zion on 27/12/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

import Foundation

extension UIColor {
    
    /// RGB Color
    public convenience init(r red: Float, g green: Float, b blue: Float, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(red/255.0), green: CGFloat(green/255.0), blue: CGFloat(blue/255.0), alpha: alpha)
    }
}
