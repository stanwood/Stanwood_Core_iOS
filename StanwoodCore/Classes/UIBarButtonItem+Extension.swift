//
//  UIBarButtonItem+Extension.swift
//  StanwoodCore
//
//  Created by Tal Zion on 12/02/2018.
//

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
    convenience public init(localizedTitle: String, style: UIBarButtonItemStyle, target: Any?, action: Selector?) {
        self.init(title: localizedTitle.localized, style: style, target: target, action: action)
        accessibilityIdentifier = localizedTitle
    }
}
