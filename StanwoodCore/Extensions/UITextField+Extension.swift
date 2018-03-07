//
//  UITextField+Extension.swift
//  StanwoodCore
//
//  Created by Tal Zion on 29/01/2018.
//

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
