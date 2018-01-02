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
    
    /**
     Sets the title to use for the specified state.
     Use this method to set the title for the button. The title you specify derives its formatting from the button’s associated label object. If you set both a title and an attributed title for the button, the button prefers the use of the attributed title over this one.
     At a minimum, you should set the value for the normal state. If a title is not specified for a state, the default behavior is to use the title associated with the normal state. If the value for normal is not set, then the property defaults to a system value.
    
     - Parameters:
       - title: The title to localise and use for the specified state.
       - state: The state that uses the specified title. The possible values are described in UIControlState.
       - tableName: the .string table name if any
     - Returns: the localised title for state
     */
    @discardableResult
    open func setLocalisedTitle(_ title: String?, for state: UIControlState, fromTableName tableName: String? = nil) -> String? {
        accessibilityIdentifier = title
        setTitle(title?.localise(fromTableName: tableName), for: state)
        return self.title(for: state)
    }
}
