//
//  Storyboard+Extension.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/28/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation

extension UIStoryboard {
    
    static func instantiate<Element: UIViewController>(viewController type: Element.Type) -> Element {
        
        let storyboard = UIStoryboard(name: type.identifier, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: type.identifier) as? Element else {
            fatalError("Cannot instantiate viewController of type: \(type.identifier)")
        }
        return viewController
    }
}
