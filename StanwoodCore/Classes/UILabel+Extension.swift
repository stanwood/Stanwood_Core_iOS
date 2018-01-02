//
//  UILabel+Extension.swift
//  StanwoodCore
//
//  Created by Tal Zion on 09/10/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

import Foundation

extension UILabel {
    
    /// Localising label and sets the accessibilityIdentifier
    open var localisedText: String? {
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
        localisedText = text
    }
    
    /**
     Sets the localised title from a table.string file
     
     - Parameters:
        - text: The text to localise
        - tableName: the .string table name if any
     - Returns: the localised title `String?`
     */
    @discardableResult
    open func localiseText(_ text: String, fromTableName tableName: String?) -> String? {
        self.text = text.localise(fromTableName: tableName)
        return self.text
    }
}
