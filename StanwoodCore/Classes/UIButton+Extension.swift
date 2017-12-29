//
//  UIButton+Extension.swift
//  Pods-StanwoodCore_Example
//
//  Created by Tal Zion on 09/10/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

import Foundation

extension UIButton {
    
    /// Localising button title
    open var localisedTitle: String? {
        get {
            return titleLabel?.text
        }
        set {
            // accessibilityIdentifier is set for UITesting tool
            accessibilityIdentifier = newValue
            setTitle(newValue?.localized, for: .normal)
        }
    }
    
    /// When working with xib elements, set the localised key in IB
    open override func awakeFromNib() {
        super.awakeFromNib()
        localisedTitle = titleLabel?.text
    }
    
    @discardableResult
    open func localiseTitle(_ text: String, fromTableName tableName: String?) -> String? {
        setTitle(text.localise(fromTableName: tableName), for: .normal)
        return titleLabel?.text
    }
}
