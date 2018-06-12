//
//  UILabel+Extension.swift
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

extension UILabel {
    
    /// Localizing label and sets the accessibilityIdentifier
    @objc open var localizedText: String? {
        get {
            return text
        }
        set {
            
            // accessibilityIdentifier is set for UITesting tool
            accessibilityIdentifier = newValue
            text = newValue?.localized
            
            #if DEBUG
                guard newValue != nil else { return }
                UITestingCore.record(key: newValue, text: text, atElement: String(describing: UILabel.self))
            #endif
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        localizedText = text
    }
    
    /**
     Sets the localized title from a table.string file.
     
     - Parameters:
        - text: The text to localize
        - tableName: the .string table name if any
     - Returns: the localized title `String?`
     */
    @discardableResult
    @objc open func localizeText(_ text: String, fromTableName tableName: String?) -> String? {
        self.text = text.localize(fromTableName: tableName)
        
        #if DEBUG
            UITestingCore.record(key: text, text: text.localize(fromTableName: tableName), atElement: String(describing: UILabel.self))
        #endif
        
        return self.text
    }
    
    /**
     Sets the localized text with format.
     
     - Parameters:
        - text: The text to localize
        - arguments: The arguments to replace
     - Returns: the localized text `String?` with format
     */
    @discardableResult
    open func localizeText(formatKey: String, _ arguments: CVarArg...) -> String? {
        accessibilityIdentifier = formatKey
        let title = String(format: formatKey.localized, arguments: arguments)
        self.text = title
        
        #if DEBUG
            UITestingCore.record(key: formatKey, text: title, atElement: String(describing: UILabel.self))
        #endif
        
        return self.text
    }
}
