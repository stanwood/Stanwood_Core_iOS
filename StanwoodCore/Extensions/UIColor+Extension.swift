//
//  UIColor+Extension.swift
//  StanwoodCore
//
//  Created by Tal Zion on 27/12/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

import Foundation

extension UIColor {
    
    /**
     RGB Color convinience initialiser
     
     #####Example: Burgundy color#####
     ````swift
     let burgundy = UIColor(r: 50, g: 0, b: 12)
     ````
     */
    public convenience init(r red: Float, g green: Float, b blue: Float, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(red/255.0), green: CGFloat(green/255.0), blue: CGFloat(blue/255.0), alpha: alpha)
    }
    
    /**
     A convenience initializer for using a 6-digit hex colors.
     
     - Parameters:
        - hex: hex color code
     */
    public convenience init(hex: String) {
        let hexPrefix = "0x"
        let start = hex.index(hex.startIndex, offsetBy: 2)
        let end = hex.endIndex
        var chars = Array(hex.hasPrefix(hexPrefix) ? String(hex[start..<end]) : hex)
        
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 1
        switch chars.count {
        case 3:
            chars = [chars[0], chars[0], chars[1], chars[1], chars[2], chars[2]]
            fallthrough
        case 6:
            chars = ["F","F"] + chars
            fallthrough
        case 8:
            alpha = CGFloat(strtoul(String(chars[0...1]), nil, 16)) / 255
            red   = CGFloat(strtoul(String(chars[2...3]), nil, 16)) / 255
            green = CGFloat(strtoul(String(chars[4...5]), nil, 16)) / 255
            blue  = CGFloat(strtoul(String(chars[6...7]), nil, 16)) / 255
        default:
            alpha = 0
        }
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

