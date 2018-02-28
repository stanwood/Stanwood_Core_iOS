//
//  UILabel+Extension.swift
//  StanwoodCore
//
//  Created by Tal Zion on 09/10/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

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
                UITestingCore.record(key: newValue, string: text, atElement: String(describing: UILabel.self))
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
            UITestingCore.record(key: text, string: text.localize(fromTableName: tableName), atElement: String(describing: UILabel.self))
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
            UITestingCore.record(key: formatKey, string: title, atElement: String(describing: UILabel.self))
        #endif
        
        return self.text
    }
}
