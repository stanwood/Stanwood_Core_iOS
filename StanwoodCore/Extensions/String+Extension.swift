//
//  String+Extension.swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2018 Stanwood GmbH (www.stanwood.io)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

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
