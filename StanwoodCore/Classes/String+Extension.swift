//
//  String+Extension.swift
//  StanwoodCore
//
//  Created by Tal Zion on 09/10/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

import Foundation

public extension String {
    
    /// Localizing current string
    public var localized: String {
        return NSLocalizedString(self, comment: self)
    }
    
    /// Localizing current string from a table name file
    public func localize(fromTableName tableName: String?) -> String {
       return NSLocalizedString(self, tableName: tableName, comment: self)
    }

    /// Return the first charachter
    public var first: String {
        return String(prefix(1))
    }
    
    /// Returns the last charachter
    public var last: String {
        return String(suffix(1))
    }
    
    /// get http:// to url
    public var httpURLString: String {
        if contains("http") {
            return self
        } else if contains("//") {
            return "http:" + self
        } else {
            return "http://" + self
        }
    }
    
    /// Get phone format string: tel://+123456789
    var phoneFormat: String {
        return "tel://\(self)"
    }
}
