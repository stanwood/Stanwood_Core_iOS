//
//  UIButton+Extension.swift
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

extension UIButton {
    
    /// Localizing button title
    @objc open var localizedTitle: String? {
        get {
            return titleLabel?.text
        }
        set {
            // accessibilityIdentifier is set for UITesting tool
            accessibilityIdentifier = newValue
            setTitle(newValue?.localized, for: .normal)
            
            #if DEBUG
                guard newValue != nil else { return }
                UITestingCore.record(key: newValue, text: newValue?.localized, atElement: String(describing: UIButton.self))
            #endif
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        localizedTitle = titleLabel?.text
    }
    
    /**
     Sets the title to use for the specified state.
     Use this method to set the title for the button. The title you specify derives its formatting from the button’s associated label object. If you set both a title and an attributed title for the button, the button prefers the use of the attributed title over this one.
     At a minimum, you should set the value for the normal state. If a title is not specified for a state, the default behavior is to use the title associated with the normal state. If the value for normal is not set, then the property defaults to a system value.
    
     - Parameters:
       - title: The title to localize and use for the specified state.
       - state: The state that uses the specified title. The possible values are described in UIControlState.
       - tableName: the .string table name if any
     - Returns: the localised title for state
     */
    @discardableResult
    @objc open func setLocalizedTitle(_ title: String?, for state: UIControl.State = .normal, fromTableName tableName: String? = nil) -> String? {
        accessibilityIdentifier = title
        setTitle(title?.localize(fromTableName: tableName), for: state)
        
        #if DEBUG
            UITestingCore.record(key: title, text: title?.localize(fromTableName: tableName), atElement: String(describing: UIButton.self))
        #endif
        
        return self.title(for: state)
    }
    
    /**
     Sets the image to use for the specified state.
     In general, if a property is not specified for a state, the default is to use the normal value. If the normal value is not set, then the property defaults to a system value. Therefore, at a minimum, you should set the value for the normal state.
     
     - Parameters:
        - image: The image to use for the specified state.
        - identifier: The accessibilityIdentifier used for UITesting
        - state: The state that uses the specified title. The values are described in UIControlState.
     */
    @objc open func setImage(_ image: UIImage?, withIdentifier identifier: String, for state: UIControl.State = .normal) {
        accessibilityIdentifier = identifier
        setImage(image, for: state)
        
        #if DEBUG
            UITestingCore.record(key: identifier, text: identifier, atElement: String(describing: UIButton.self))
        #endif
    }
    
    /**
     Sets the localized button title with format.
     
     - Parameters:
        - text: The text to localize
        - arguments: The arguments to replace
     - Returns: the localized placeholder `String?` with format
     */
    @discardableResult
    open func localizeTitle(formatKey: String, for state: UIControl.State = .normal, _ arguments: CVarArg...) -> String? {
        accessibilityIdentifier = formatKey
        let title = String(format: formatKey.localized, arguments: arguments)
        setTitle(title, for: state)
        
        #if DEBUG
            UITestingCore.record(key: formatKey, text: title, atElement: String(describing: UIButton.self))
        #endif
        
        return self.titleLabel?.text
    }
}
