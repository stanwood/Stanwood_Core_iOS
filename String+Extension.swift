//
//  String+Extension.swift
//  StanwoodCore
//
//  Created by Tal Zion on 09/10/2017.
//

import Foundation

public extension String {
    
    // Localising current string
    public var localized: String {
        return NSLocalizedString(self, comment: self)
    }

    // Return the first charachter
    public var first: String {
        return String(characters.prefix(1))
    }
    
    // Returns the last charachter
    public var last: String {
        return String(characters.suffix(1))
    }
}
