//
//  UITextField+Extension.swift
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

extension UITextField {
    
    /// Localizing placeholder and sets the accessibilityIdentifier
    @objc open var localizedPlaceholder: String? {
        get {
            return placeholder
        }
        set {
            // accessibilityIdentifier is set for UITesting tool
            accessibilityIdentifier = newValue
            placeholder = newValue?.localized
            
            #if DEBUG
                guard newValue != nil else { return }
                UITestingCore.record(key: newValue, text: placeholder, atElement: String(describing: UITextField.self))
            #endif
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        localizedPlaceholder = placeholder
    }
    
    /**
     Sets the localized placeholder with format.
     
     - Parameters:
        - text: The text to localize
        - arguments: The arguments to replace
     - Returns: the localized placeholder `String?` with format
     */
    @discardableResult
    open func localizePlaceholder(formatKey: String, _ arguments: CVarArg...) -> String? {
        accessibilityIdentifier = formatKey
        self.placeholder = String(format: formatKey.localized, arguments: arguments)
        
        #if DEBUG
            UITestingCore.record(key: formatKey, text: placeholder, atElement: String(describing: UISearchBar.self))
        #endif
        
        return self.placeholder
    }
}
