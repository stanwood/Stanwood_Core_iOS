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
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        localizedText = text
    }
    
    /**
     Sets the localized title from a table.string file
     
     - Parameters:
        - text: The text to localize
        - tableName: the .string table name if any
     - Returns: the localized title `String?`
     */
    @discardableResult
    @objc open func localizeText(_ text: String, fromTableName tableName: String?) -> String? {
        self.text = text.localize(fromTableName: tableName)
        return self.text
    }
}
