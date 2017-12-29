//
//  UILabel+Extension.swift
//  StanwoodCore
//
//  Created by Tal Zion on 09/10/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

import Foundation

extension UILabel {
    
    /// Localising label
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
    
    /// When working with xib elements, set the localised key in IB
    open override func awakeFromNib() {
        super.awakeFromNib()
        localisedText = text
    }
    
    @discardableResult
    open func localiseText(_ text: String, fromTableName tableName: String?) -> String? {
        self.text = text.localise(fromTableName: tableName)
        return self.text
    }
}
