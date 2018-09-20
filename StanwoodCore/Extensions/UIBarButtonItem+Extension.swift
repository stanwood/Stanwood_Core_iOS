//
//  UIBarButtonItem+Extension.swift
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

extension UIBarButtonItem {
    
    /// Localizing button title
    @objc open var localizedTitle: String? {
        get {
            return title
        }
        set {
            
            // accessibilityIdentifier is set for UITesting tool
            accessibilityIdentifier = newValue
            title = newValue?.localized
            
            #if DEBUG
                guard newValue != nil else { return }
                UITestingCore.record(key: newValue, text: newValue?.localized, atElement: String(describing: UIBarButtonItem.self))
            #endif
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        localizedTitle = title
    }
    
    /**
     Initializes a new item using the specified localizedt itle and other properties.
     
     - Parameters:
        - localizedTitle: The localized item’s title key.
        - style: The style of the item. One of the constants defined in [UIBarButtonItemStyle](https://developer.apple.com/documentation/uikit/uibarbuttonitemstyle).
        - target: The object that receives the action message.
        - action: The action to send to target when this item is selected.
     
     - Returns: Newly initialized item with the specified properties.
     */
    convenience public init(localizedTitle: String, style: UIBarButtonItem.Style, target: Any?, action: Selector?) {
        self.init(title: localizedTitle.localized, style: style, target: target, action: action)
        accessibilityIdentifier = localizedTitle
        
        #if DEBUG
            UITestingCore.record(key: localizedTitle, text: localizedTitle.localized, atElement: String(describing: UIBarButtonItem.self))
        #endif
    }
    
    /**
     Sets the localized bar button item title with format.
     
     - Parameters:
        - text: The text to localize
        - arguments: The arguments to replace
     */
    @discardableResult
    convenience public init(formatKey: String, style: UIBarButtonItem.Style, target: Any?, action: Selector?, _ arguments: CVarArg...) {
        let title = String(format: formatKey.localized, arguments: arguments)
        self.init(title: title, style: style, target: target, action: action)
        accessibilityIdentifier = formatKey
        
        #if DEBUG
            UITestingCore.record(key: formatKey, text: title, atElement: String(describing: UIBarButtonItem.self))
        #endif
    }
}
