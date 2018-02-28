//
//  UISearchBar+Extension.swift
//  StanwoodCore
//
//  Created by Tal Zion on 29/01/2018.
//

import Foundation

extension UISearchBar {
    
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
                UITestingCore.record(key: newValue, string: placeholder, atElement: String(describing: UISearchBar.self))
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
        let placeholder = String(format: formatKey.localized, arguments: arguments)
        self.placeholder = placeholder
        
        #if DEBUG
            UITestingCore.record(key: formatKey, string: placeholder, atElement: String(describing: UISearchBar.self))
        #endif
        
        return self.placeholder
    }
}

